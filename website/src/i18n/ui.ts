import type { Locale } from "./meta";

type UiText = {
  nav: {
    docs: string;
  };
  social: {
    playStore: string;
  };
  footer: {
    documents: string;
    docsLink: string;
    piHoleResources: string;
    piHoleWebsite: string;
    more: string;
  };
};

export const uiText = {
  en: {
    nav: {
      docs: "Docs",
    },
    social: {
      playStore: "Google Play Store",
    },
    footer: {
      documents: "Documents",
      docsLink: "Docs",
      piHoleResources: "Pi-hole Resources",
      piHoleWebsite: "Pi-hole Website",
      more: "More",
    },
  },
  ja: {
    nav: {
      docs: "ドキュメント",
    },
    social: {
      playStore: "Google Play ストア",
    },
    footer: {
      documents: "ドキュメント",
      docsLink: "ドキュメントを見る",
      piHoleResources: "Pi-hole関連リンク",
      piHoleWebsite: "Pi-hole公式サイト",
      more: "その他",
    },
  },
} as const satisfies Record<Locale, UiText>;
