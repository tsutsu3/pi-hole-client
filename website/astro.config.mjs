// @ts-check
import fs from "node:fs";
import { fileURLToPath } from "node:url";
import { defineConfig } from "astro/config";
import starlight from "@astrojs/starlight";
import react from "@astrojs/react";
import starlightLinksValidator from "starlight-links-validator";

const githubUrl = "https://github.com/tsutsu3/pi-hole-client";
const websiteUrl = "https://tsutsu3.github.io/pi-hole-client";
const ogImageUrl = `${websiteUrl}/img/feature-image-og.png`;
const description =
  "Pi-hole client is a mobile application that allows you to manage your Pi-hole server from your smartphone.";

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
      content: "Manage your Pi-hole server easily from your smartphone with Pi-hole client.",
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
      content: "Monitor and control your Pi-hole server with Pi-hole client for mobile.",
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
  { label: "Introduction", slug: "docs/intro" },
  { label: "Getting Started", slug: "docs/getting-started" },
  {
    label: "User Manual",
    items: [
      { label: "Overview", slug: "docs/user-manual" },
      "docs/user-manual/home",
      "docs/user-manual/statistics",
      "docs/user-manual/logs",
      "docs/user-manual/domains",
      {
        label: "Settings",
        items: [
          { label: "Overview", slug: "docs/user-manual/settings" },
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
    items: [
      "docs/guides/installation",
      "docs/guides/create-a-connection",
      "docs/guides/get-api-token",
      "docs/guides/cert-config",
    ],
  },
  { label: "Help", items: ["docs/help/faq", "docs/help/privacy"] },
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
    }),
    legacySitemap,
  ],
  vite: {
    resolve: {
      alias: {
        "@site": fileURLToPath(new URL("./", import.meta.url)),
      },
    },
  },
});
