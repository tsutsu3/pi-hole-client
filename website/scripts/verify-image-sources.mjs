// Checks that every responsive image has enough resolution for its displayed size.
//
// Astro may clamp requested image widths to the source width, causing a 2x image
// request to silently fall back to 1x.
//
// Run after `astro build`.

import fs from "node:fs";
import path from "node:path";
import { fileURLToPath } from "node:url";

const distDir = fileURLToPath(new URL("../dist/", import.meta.url));

/** Minimum source-to-display width ratio required for retina displays. */
const MIN_RESOLUTION_RATIO = 2;

/**
 * Images intentionally allowed below MIN_RESOLUTION_RATIO.
 * Keyed by the source image base name.
 */
const ALLOWED_LOW_RESOLUTION_IMAGES = new Map([
  ["show-loading-animation", "52-frame animation; the 320w webp is already 482KB"],
  ["server-cert-status-all", "1.83x, close enough to 2x"],
  ["home-widget-01", "1.83x, close enough to 2x"],
  ["server-menu-view-update-cert", "1.95x, close enough to 2x"],
  ["home-tiles", "1.97x, close enough to 2x"],
  ["05", "guides/images/05.png, 1.99x, close enough to 2x"],
]);

if (!fs.existsSync(distDir)) {
  console.error(`dist/ not found at ${distDir}. Run "pnpm build" first.`);
  process.exit(1);
}

function listFiles(dir) {
  return fs.readdirSync(dir, { withFileTypes: true }).flatMap((entry) => {
    const filePath = path.join(dir, entry.name);
    return entry.isDirectory() ? listFiles(filePath) : [filePath];
  });
}

/**
 * Returns the intended display width recorded by doc-image.astro.
 *
 * The actual layout width may be capped to the source width, so this value is
 * used when recommending the required source image size.
 */
function getTargetWidth(imgTag) {
  const width = imgTag.match(/ data-target-width="(\d+)"/i)?.[1];
  return width ? Number(width) : null;
}

/** Returns the image's displayed width in CSS pixels. */
function getDisplayedWidth(imgTag) {
  const sizes = imgTag.match(/ sizes="([^"]+)"/i)?.[1];

  const fixedWidth = sizes
    ?.split(",")
    .at(-1)
    ?.trim()
    .match(/^(\d+)px$/)?.[1];

  if (fixedWidth) return Number(fixedWidth);

  const width = imgTag.match(/ width="(\d+)"/i)?.[1];
  return width ? Number(width) : null;
}

/** Returns the widest candidate in srcset, in image pixels. */
function getMaxSourceWidth(imgTag) {
  const srcset = imgTag.match(/ srcset="([^"]+)"/i)?.[1];
  if (!srcset) return null;

  const candidateWidths = [...srcset.matchAll(/ (\d+)w(?:,|$)/g)].map((match) => Number(match[1]));

  return candidateWidths.length > 0 ? Math.max(...candidateWidths) : null;
}

const errors = [];
const warnings = [];
const allowedWarnings = [];
const checkedImages = new Set();

let checkedImageCount = 0;

const htmlFiles = listFiles(distDir).filter((filePath) => filePath.endsWith(".html"));

for (const htmlFile of htmlFiles) {
  const html = fs.readFileSync(htmlFile, "utf8");

  for (const [imgTag] of html.matchAll(/<img\b[^>]*>/gi)) {
    const maxSourceWidth = getMaxSourceWidth(imgTag);
    const displayedWidth = getDisplayedWidth(imgTag);

    // Skip non-responsive images such as logos and icons.
    if (!maxSourceWidth || !displayedWidth) continue;

    const src = imgTag.match(/ src="([^"]+)"/i)?.[1] ?? "";
    const imageName = path.basename(src).split(".")[0];

    const imageKey = `${imageName}@${displayedWidth}`;

    // The same image may appear on both English and Japanese pages.
    if (checkedImages.has(imageKey)) continue;

    checkedImages.add(imageKey);
    checkedImageCount += 1;

    const resolutionRatio = maxSourceWidth / displayedWidth;

    if (resolutionRatio >= MIN_RESOLUTION_RATIO) continue;

    const targetWidth = getTargetWidth(imgTag) ?? displayedWidth;
    const cappedNote = targetWidth === displayedWidth ? "" : ` (capped from ${targetWidth}px)`;

    const requiredSourceWidth = targetWidth * MIN_RESOLUTION_RATIO;

    const message =
      `${imageName} renders at ${displayedWidth}px${cappedNote} but only ` +
      `${maxSourceWidth}px is available (${resolutionRatio.toFixed(2)}x); ` +
      `re-export it at ${requiredSourceWidth}px wide`;

    if (ALLOWED_LOW_RESOLUTION_IMAGES.has(imageName)) {
      allowedWarnings.push(
        `${message} - accepted: ${ALLOWED_LOW_RESOLUTION_IMAGES.get(imageName)}`,
      );
    } else if (resolutionRatio < 1) {
      errors.push(`${message} - UPSCALED`);
    } else {
      warnings.push(message);
    }
  }
}

if (errors.length > 0) {
  console.error(`verify:images failed with ${errors.length} error(s):`);
  for (const error of errors) console.error(`  - ${error}`);
}

if (warnings.length > 0) {
  console.warn(`verify:images: ${warnings.length} image(s) below ${MIN_RESOLUTION_RATIO}x:`);
  for (const warning of warnings) console.warn(`  - ${warning}`);
}

if (errors.length > 0) process.exit(1);

console.log(
  `verify:images ok (${checkedImageCount} responsive images, ` +
    `${warnings.length} below ${MIN_RESOLUTION_RATIO}x, ` +
    `${allowedWarnings.length} accepted)`,
);
