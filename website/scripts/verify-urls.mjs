// Checks the built site for the URLs the app and search engines depend on, and
// resolves every internal link the way a browser would.
// Run after `astro build`.
import fs from "node:fs";
import path from "node:path";
import { fileURLToPath } from "node:url";

const dist = fileURLToPath(new URL("../dist/", import.meta.url));
const BASE = "/pi-hole-client";
const ORIGIN = "https://tsutsu3.github.io";

const DOC_PAGES = [
  "docs/intro",
  "docs/getting-started",
  "docs/user-manual",
  "docs/user-manual/home",
  "docs/user-manual/statistics",
  "docs/user-manual/logs",
  "docs/user-manual/domains",
  "docs/user-manual/settings",
  "docs/user-manual/settings/app-settings",
  "docs/user-manual/settings/server-settings",
  "docs/user-manual/settings/about",
  "docs/user-manual/android-home-widget",
  "docs/guides/installation",
  "docs/guides/create-a-connection",
  "docs/guides/get-api-token",
  "docs/guides/cert-config",
  "docs/help/faq",
  "docs/help/privacy",
];

// Hard-coded in lib/ui/core/ui/helpers/urls.dart; already-shipped app builds
// deep-link to these, so they must keep working.
const DEEP_LINKS = [
  { page: "docs/guides/create-a-connection", anchor: null },
  { page: "docs/help/privacy", anchor: null },
  { page: "docs/guides/cert-config", anchor: "after-app-update-backward-compatibility" },
  {
    page: "docs/guides/cert-config",
    anchor: "ssl-error-with-a-valid-lets-encrypt-certificate-incomplete-chain",
  },
];

const OTHER_FILES = ["index.html", "404.html", "sitemap.xml", "sitemap-index.xml"];

const errors = [];

if (!fs.existsSync(dist)) {
  console.error(`dist/ not found at ${dist}. Run "pnpm build" first.`);
  process.exit(1);
}

function walk(dir) {
  return fs.readdirSync(dir, { withFileTypes: true }).flatMap((entry) => {
    const p = path.join(dir, entry.name);
    return entry.isDirectory() ? walk(p) : [p];
  });
}

const files = walk(dist);
const htmlFiles = files.filter((f) => f.endsWith(".html"));

/** Every path that exists in dist/, as a URL pathname including the base. */
const assetPaths = new Set(
  files.map((f) => `${BASE}/${path.relative(dist, f).split(path.sep).join("/")}`),
);

/** Page pathname (with trailing slash) -> set of anchor ids on that page. */
const pages = new Map();
for (const file of htmlFiles) {
  const rel = path.relative(dist, file).split(path.sep).join("/");
  const pathname = rel.endsWith("/index.html")
    ? `${BASE}/${rel.slice(0, -"index.html".length)}`
    : rel === "index.html"
      ? `${BASE}/`
      : `${BASE}/${rel}`;
  const html = fs.readFileSync(file, "utf8");
  const ids = new Set([...html.matchAll(/\s(?:id|name)="([^"]+)"/g)].map((m) => m[1]));
  pages.set(pathname, ids);
}

// --- required pages, files and deep links ---
for (const page of DOC_PAGES) {
  if (!pages.has(`${BASE}/${page}/`)) errors.push(`missing page: ${BASE}/${page}/`);
}

for (const file of OTHER_FILES) {
  if (!assetPaths.has(`${BASE}/${file}`)) errors.push(`missing file: ${BASE}/${file}`);
}

for (const { page, anchor } of DEEP_LINKS) {
  const ids = pages.get(`${BASE}/${page}/`);
  if (!ids) {
    errors.push(`missing deep link target: ${BASE}/${page}/`);
  } else if (anchor && !ids.has(anchor)) {
    errors.push(`missing anchor: ${BASE}/${page}/#${anchor}`);
  }
}

// --- every internal link resolves to a real page and anchor ---
for (const pathname of pages.keys()) {
  const relative = pathname.slice(BASE.length + 1);
  const file = pathname.endsWith("/")
    ? path.join(dist, relative, "index.html")
    : path.join(dist, relative);
  const html = fs.readFileSync(file, "utf8");

  for (const [, href] of html.matchAll(/<a\b[^>]*\shref="([^"]+)"/g)) {
    if (/^(?:[a-z][a-z0-9+.-]*:|\/\/)/i.test(href)) continue; // external / mailto / protocol-relative

    let target;
    try {
      target = new URL(href, ORIGIN + pathname);
    } catch {
      errors.push(`unparsable link "${href}" on ${pathname}`);
      continue;
    }
    if (target.origin !== ORIGIN) continue;

    const targetPath = target.pathname;
    const hash = decodeURIComponent(target.hash.slice(1));
    const withSlash = targetPath.endsWith("/") ? targetPath : `${targetPath}/`;
    const ids = pages.get(targetPath) ?? pages.get(withSlash);

    if (!ids) {
      if (assetPaths.has(targetPath)) continue; // link to a static file
      errors.push(`broken link "${href}" on ${pathname} -> ${targetPath}`);
      continue;
    }
    if (hash && !ids.has(hash)) {
      errors.push(`broken anchor "${href}" on ${pathname} -> ${targetPath}#${hash}`);
    }
  }
}

// An ImageMetadata rendered without `.src` stringifies to "[object Object]".
for (const file of htmlFiles) {
  if (fs.readFileSync(file, "utf8").includes("[object Object]")) {
    errors.push(`"[object Object]" found in ${path.relative(dist, file)}`);
  }
}

if (errors.length > 0) {
  console.error(`verify:urls failed with ${errors.length} error(s):`);
  for (const error of errors) console.error(`  - ${error}`);
  process.exit(1);
}

console.log(
  `verify:urls ok (${DOC_PAGES.length} pages, ${OTHER_FILES.length} files, ` +
    `${DEEP_LINKS.length} deep links, ${pages.size} HTML pages link-checked)`,
);
