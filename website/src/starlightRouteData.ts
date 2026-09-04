import { defineRouteMiddleware, type StarlightRouteData } from "@astrojs/starlight/route-data";
import { DEFAULT_LOCALE, isLocale, meta, ogLocale } from "./i18n/meta";

/** Attributes of the `<meta>` tag carrying `attrs`, e.g. `{ property: "og:description" }`. */
function findMeta(head: StarlightRouteData["head"], attrs: Record<string, string>) {
  const [key, value] = Object.entries(attrs)[0]!;
  return head.find((tag) => tag.tag === "meta" && tag.attrs?.[key] === value)?.attrs;
}

export const onRequest = defineRouteMiddleware((context) => {
  const { head, lang } = context.locals.starlightRoute;
  if (!isLocale(lang) || lang === DEFAULT_LOCALE) return;

  for (const entry of Object.values(meta)) {
    const attrs = findMeta(head, entry.tag);
    if (attrs?.content === entry[DEFAULT_LOCALE]) attrs.content = entry[lang];
  }

  const locale = findMeta(head, { property: "og:locale" });
  if (locale) locale.content = ogLocale[lang];

  // The site is bilingual, so the only alternate is the default locale.
  const alternate = findMeta(head, { property: "og:locale:alternate" });
  if (alternate) alternate.content = ogLocale[DEFAULT_LOCALE];
});
