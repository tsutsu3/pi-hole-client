// @ts-check
import fs from "node:fs";
import path from "node:path";
import { fileURLToPath } from "node:url";
import { defineConfig } from "astro/config";
import starlight from "@astrojs/starlight";
import react from "@astrojs/react";
import starlightLinksValidator from "starlight-links-validator";
import { meta } from "./src/i18n/meta";

const githubUrl = "https://github.com/tsutsu3/pi-hole-client";
const websiteUrl = "https://tsutsu3.github.io/pi-hole-client";
const ogImageUrl = `${websiteUrl}/img/feature-image-og.png`;
const description = meta.description.en;

/**
 * Docusaurus published the sitemap at /sitemap.xml and that URL is registered in
 * Google Search Console. Astro writes sitemap-index.xml, so mirror it back.
 * @type {import("astro").AstroIntegration}
 */
const legacySitemap = {
  name: "legacy-sitemap",
  hooks: {
    "astro:build:done": ({ dir, logger }) => {
      const source = new URL("./sitemap-index.xml", dir);
      if (!fs.existsSync(source)) {
        logger.warn("sitemap-index.xml not found; /sitemap.xml was not created");
        return;
      }
      fs.copyFileSync(source, new URL("./sitemap.xml", dir));
      logger.info("copied sitemap-index.xml to sitemap.xml");
    },
  },
};

/**
 * Astro emits unused original images alongside optimized variants.
 * Remove unreferenced images from _astro/ to reduce the Pages artifact size.
 * @type {import("astro").AstroIntegration}
 */
const pruneUnusedAssets = {
  name: "prune-unused-assets",

  hooks: {
    "astro:build:done": ({ dir, logger }) => {
      const distDir = fileURLToPath(dir);
      const astroAssetDir = path.join(distDir, "_astro");

      if (!fs.existsSync(astroAssetDir)) return;

      const IMAGE_EXTENSIONS = [".png", ".jpg", ".jpeg", ".gif", ".webp", ".avif", ".svg"];

      /** @param {string} filePath */
      const isImageFile = (filePath) =>
        IMAGE_EXTENSIONS.some((ext) => filePath.toLowerCase().endsWith(ext));

      /**
       * @param {string} dirPath
       * @returns {string[]}
       */
      const listFiles = (dirPath) =>
        fs.readdirSync(dirPath, { withFileTypes: true }).flatMap((entry) => {
          const filePath = path.join(dirPath, entry.name);
          return entry.isDirectory() ? listFiles(filePath) : [filePath];
        });

      const referencedContent = listFiles(distDir)
        .filter((filePath) => !isImageFile(filePath))
        .map((filePath) => fs.readFileSync(filePath, "latin1"))
        .join(" ");

      let removedImageCount = 0;
      let removedBytes = 0;

      for (const fileName of fs.readdirSync(astroAssetDir)) {
        if (!isImageFile(fileName) || referencedContent.includes(fileName)) {
          continue;
        }

        const filePath = path.join(astroAssetDir, fileName);

        removedBytes += fs.statSync(filePath).size;
        fs.rmSync(filePath);
        removedImageCount += 1;
      }

      const removedMegabytes = removedBytes / 1024 / 1024;

      logger.info(
        `removed ${removedImageCount} unreferenced image(s), ${removedMegabytes.toFixed(1)}MB`,
      );
    },
  },
};

/** @type {import("@astrojs/starlight/types").StarlightUserConfig["head"]} */
const head = [
  {
    tag: "meta",
    attrs: {
      name: "keywords",
      content: "Pi-hole, adblock, DNS sinkhole, network, client, dashboard",
    },
  },
  { tag: "meta", attrs: { name: "author", content: "tsutsu3" } },
  { tag: "meta", attrs: { name: "publisher", content: "Pi-hole client Project" } },

  // Open Graph
  { tag: "meta", attrs: { property: "og:title", content: "Pi-hole client" } },
  {
    tag: "meta",
    attrs: {
      property: "og:description",
      content: meta.ogDescription.en,
    },
  },
  { tag: "meta", attrs: { property: "og:type", content: "website" } },
  { tag: "meta", attrs: { property: "og:site_name", content: "Pi-hole client" } },
  { tag: "meta", attrs: { property: "og:url", content: websiteUrl } },
  { tag: "meta", attrs: { property: "og:image", content: ogImageUrl } },
  { tag: "meta", attrs: { property: "og:image:width", content: "1200" } },
  { tag: "meta", attrs: { property: "og:image:height", content: "630" } },
  { tag: "meta", attrs: { property: "og:locale", content: "en_US" } },
  { tag: "meta", attrs: { property: "og:locale:alternate", content: "ja_JP" } },

  // X/Twitter
  { tag: "meta", attrs: { name: "twitter:card", content: "summary_large_image" } },
  { tag: "meta", attrs: { name: "twitter:title", content: "Pi-hole client" } },
  {
    tag: "meta",
    attrs: {
      name: "twitter:description",
      content: meta.twitterDescription.en,
    },
  },
  { tag: "meta", attrs: { name: "twitter:image", content: ogImageUrl } },
  { tag: "meta", attrs: { name: "twitter:creator", content: "@_tsutsu3" } },

  // Google Search Console
  {
    tag: "meta",
    attrs: {
      name: "google-site-verification",
      content: "QcUHWbCbOodhUhP5h_PSpMNELHwN8H9_ATs9MfvWbSo",
    },
  },
];

/** @type {import("@astrojs/starlight/types").StarlightUserConfig["sidebar"]} */
const sidebar = [
  { label: "Introduction", translations: { ja: "はじめに" }, slug: "docs/intro" },
  { label: "Getting Started", translations: { ja: "セットアップ" }, slug: "docs/getting-started" },
  {
    label: "User Manual",
    translations: { ja: "ユーザーマニュアル" },
    items: [
      { label: "Overview", translations: { ja: "概要" }, slug: "docs/user-manual" },
      "docs/user-manual/home",
      "docs/user-manual/statistics",
      "docs/user-manual/logs",
      "docs/user-manual/domains",
      {
        label: "Settings",
        translations: { ja: "設定" },
        items: [
          { label: "Overview", translations: { ja: "概要" }, slug: "docs/user-manual/settings" },
          "docs/user-manual/settings/app-settings",
          "docs/user-manual/settings/server-settings",
          "docs/user-manual/settings/about",
        ],
      },
      "docs/user-manual/android-home-widget",
    ],
  },
  {
    label: "Guides",
    translations: { ja: "ガイド" },
    items: [
      "docs/guides/installation",
      "docs/guides/create-a-connection",
      "docs/guides/get-api-token",
      "docs/guides/cert-config",
    ],
  },
  {
    label: "Help",
    translations: { ja: "ヘルプ" },
    items: ["docs/help/faq", "docs/help/privacy"],
  },
];

// https://astro.build/config
export default defineConfig({
  site: "https://tsutsu3.github.io",
  base: "/pi-hole-client",
  trailingSlash: "always",
  integrations: [
    react(),
    starlight({
      title: "Pi-hole client",
      description,
      defaultLocale: "root",
      locales: {
        root: { label: "English", lang: "en" },
        ja: { label: "日本語", lang: "ja" },
      },
      disable404Route: true,
      favicon: "/img/favicon.ico",
      logo: {
        src: "./src/assets/pi-hole-client-icon-large-round.svg",
        alt: "Pi-hole client Logo",
      },
      customCss: ["./src/styles/custom.css"],
      editLink: { baseUrl: `${githubUrl}/blob/main/website/` },
      social: [{ icon: "github", label: "GitHub", href: githubUrl }],
      // Relative links are checked against the built HTML by scripts/verify-urls.mjs,
      // which resolves them the way a browser does.
      plugins: [starlightLinksValidator({ errorOnRelativeLinks: false })],
      components: {
        Header: "./src/components/overrides/Header.astro",
        PageTitle: "./src/components/overrides/PageTitle.astro",
        SocialIcons: "./src/components/overrides/SocialIcons.astro",
        Footer: "./src/components/overrides/Footer.astro",
      },
      head,
      sidebar,
      // Rewrites the language-dependent `head` entries above on Japanese routes.
      routeMiddleware: "./src/starlightRouteData.ts",
    }),
    legacySitemap,
    pruneUnusedAssets,
  ],
  vite: {
    resolve: {
      alias: {
        "@site": fileURLToPath(new URL("./", import.meta.url)),
      },
    },
  },
});
