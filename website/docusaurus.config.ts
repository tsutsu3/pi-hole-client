import { themes as prismThemes } from "prism-react-renderer";
import type { Config } from "@docusaurus/types";
import type * as Preset from "@docusaurus/preset-classic";

const githubUrl = "https://github.com/tsutsu3/pi-hole-client";

const websiteUrl = "https://tsutsu3.github.io/pi-hole-client";

const playStoreUrl =
  "https://play.google.com/store/apps/details?id=io.github.tsutsu3.pi_hole_client";

const config: Config = {
  title: "Pi-hole client",
  tagline: "Pi-hole mobile client",
  favicon: "/img/favicon.ico",

  future: {
    v4: true, // Improve compatibility with the upcoming Docusaurus v4
  },

  // Set the production url of your site here
  url: "https://tsutsu3.github.io",
  // Set the /<baseUrl>/ pathname under which your site is served
  // For GitHub pages deployment, it is often '/<projectName>/'
  baseUrl: "/pi-hole-client/",

  // GitHub pages deployment config.
  // If you aren't using GitHub pages, you don't need these.
  organizationName: "tsutsu3", // Usually your GitHub org/user name.
  projectName: "pi-hole-client", // Usually your repo name.
  trailingSlash: true,

  onBrokenLinks: "throw",
  onBrokenMarkdownLinks: "warn",

  // Even if you don't use internationalization, you can use this field to set
  // useful metadata like html lang. For example, if your site is Chinese, you
  // may want to replace "en" with "zh-Hans".
  i18n: {
    defaultLocale: "en",
    locales: ["en"],
  },

  presets: [
    [
      "classic",
      {
        docs: {
          sidebarPath: "./sidebars.ts",
          editUrl: `${githubUrl}/blob/main/website`,
        },
        theme: {
          customCss: "./src/css/custom.css",
        },
        sitemap: {
          ignorePatterns: ["**/search", "**/search/**"],
        },
      } satisfies Preset.Options,
    ],
  ],

  themeConfig: {
    metadata: [
      // Basic SEO
      {
        name: "description",
        content:
          "Pi-hole client is a mobile application that allows you to manage your Pi-hole server from your smartphone.",
      },
      {
        name: "keywords",
        content: "Pi-hole, adblock, DNS sinkhole, network, client, dashboard",
      },
      { name: "author", content: "tsutsu3" },
      { name: "publisher", content: "Pi-hole client Project" },

      // Open Graph
      { property: "og:title", content: "Pi-hole client" },
      {
        property: "og:description",
        content: "Manage your Pi-hole server easily from your smartphone with Pi-hole client.",
      },
      { property: "og:type", content: "website" },
      { property: "og:site_name", content: "Pi-hole client" },
      { property: "og:url", content: websiteUrl },
      { property: "og:image", content: `${websiteUrl}/img/feature-image-og.png` },
      { property: "og:image:width", content: "1200" },
      { property: "og:image:height", content: "630" },
      { property: "og:locale", content: "en_US" },
      { property: "og:locale:alternate", content: "ja_JP" },

      // X/Twitter
      { name: "twitter:card", content: "summary_large_image" },
      { name: "twitter:title", content: "Pi-hole client" },
      {
        name: "twitter:description",
        content: "Monitor and control your Pi-hole server with Pi-hole client for mobile.",
      },
      { name: "twitter:image", content: `${websiteUrl}/img/feature-image-og.png` },
      { name: "twitter:creator", content: "@_tsutsu3" },
      // Algolia
      { name: "algolia-site-verification", content: "30C71A65927B89BB" },
      // Google Search Console
      { name: "google-site-verification", content: "QcUHWbCbOodhUhP5h_PSpMNELHwN8H9_ATs9MfvWbSo" },
    ],
    algolia: {
      // The application ID provided by Algolia
      appId: "INFPBXF0SW",

      // Public API key: it is safe to commit it
      apiKey: "c233e68c3f0be545a11a9aff81236036",

      indexName: "Pi-hole client web",

      // Optional: see doc section below
      contextualSearch: true,

      // Optional: Replace parts of the item URLs from Algolia. Useful when using the same search index for multiple deployments using a different baseUrl. You can use regexp or string in the `from` param. For example: localhost:3000 vs myCompany.com/docs
      replaceSearchResultPathname: {
        from: "/pi-hole-client/", // or as RegExp: /\/docs\//
        to: "/",
      },

      // Optional: whether the insights feature is enabled or not on Docsearch (`false` by default)
      insights: false,

      //... other Algolia params
    },
    colorMode: {
      defaultMode: "light",
      disableSwitch: false,
      respectPrefersColorScheme: true,
    },
    navbar: {
      hideOnScroll: true,
      title: "Pi-hole client",
      logo: {
        alt: "Pi-hole client Logo",
        src: "/img/pi-hole-client-icon-large-round.svg",
      },
      items: [
        {
          type: "docSidebar",
          sidebarId: "tutorialSidebar",
          position: "left",
          label: "Docs",
        },
        {
          href: playStoreUrl,
          position: "right",
          className: "header-play-link",
          "aria-label": "Google Play Store",
        },
        {
          href: githubUrl,
          position: "right",
          className: "header-github-link",
          "aria-label": "GitHub repository",
        },
      ],
    },
    footer: {
      style: "light",
      links: [
        {
          title: "Documents",
          items: [
            {
              label: "Docs",
              to: "/docs/intro",
            },
          ],
        },
        {
          title: "Pi-hole Resources",
          items: [
            {
              label: "Pi-hole Website",
              href: "https://pi-hole.net/",
            },
          ],
        },
        {
          title: "More",
          items: [
            {
              label: "GitHub",
              href: githubUrl,
            },
            {
              label: "Google Play Store",
              href: playStoreUrl,
            },
          ],
        },
      ],
      copyright: `Copyright © ${new Date().getFullYear()} tsutsu3.`,
    },
    prism: {
      theme: prismThemes.github,
      darkTheme: prismThemes.dracula,
    },
  } satisfies Preset.ThemeConfig,
};

export default config;
