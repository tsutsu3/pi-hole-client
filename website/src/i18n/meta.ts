// Site-wide `<meta>` text, in every locale the site is built for.

export const locales = ["en", "ja"] as const;

export type Locale = (typeof locales)[number];

export const DEFAULT_LOCALE: Locale = "en";

export function isLocale(value: string): value is Locale {
  return (locales as readonly string[]).includes(value);
}

export function resolveLocale(value: string | undefined): Locale {
  return value && isLocale(value) ? value : DEFAULT_LOCALE;
}

export function localizedPath(locale: Locale, path: string): string {
  const normalizedPath = path.replace(/^\/+/, "");
  return locale === DEFAULT_LOCALE ? normalizedPath : `${locale}/${normalizedPath}`;
}

/** `og:locale` value for each locale. */
export const ogLocale: Record<Locale, string> = {
  en: "en_US",
  ja: "ja_JP",
};

type MetaEntry = {
  /** The single attribute that identifies the `<meta>` tag to rewrite. */
  tag: { name: string } | { property: string };
} & Record<Locale, string>;

export const meta = {
  description: {
    tag: { name: "description" },
    en: "Pi-hole client is a mobile application that allows you to manage your Pi-hole server from your smartphone.",
    ja: "Pi-hole clientは、スマートフォンからPi-holeサーバーを管理できるモバイルアプリです。",
  },
  ogDescription: {
    tag: { property: "og:description" },
    en: "Manage your Pi-hole server easily from your smartphone with Pi-hole client.",
    ja: "Pi-hole clientで、スマートフォンからPi-holeサーバーを手軽に管理できます。",
  },
  twitterDescription: {
    tag: { name: "twitter:description" },
    en: "Monitor and control your Pi-hole server with Pi-hole client for mobile.",
    ja: "Pi-hole client for mobileで、Pi-holeサーバーの監視と操作をスマートフォンから行えます。",
  },
} as const satisfies Record<string, MetaEntry>;
