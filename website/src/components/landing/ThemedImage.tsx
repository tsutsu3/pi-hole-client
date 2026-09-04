import React from "react";
import clsx from "clsx";

export type ResponsiveImageSource = {
  readonly src: string;
  readonly srcSet: string;
  readonly avifSrcSet: string;
  readonly sizes: string;
  readonly width: number;
  readonly height: number;
};

type Props = {
  readonly alt: string;
  readonly className?: string;
  readonly sources: { light: ResponsiveImageSource; dark: ResponsiveImageSource };
};

/** One `<picture>`, offering AVIF first and falling back to WebP. */
export function ResponsiveImage({
  source,
  alt,
  className,
  fetchPriority,
}: {
  readonly source: ResponsiveImageSource;
  readonly alt: string;
  readonly className?: string;
  readonly fetchPriority?: "high";
}): React.JSX.Element {
  return (
    <picture>
      <source type="image/avif" srcSet={source.avifSrcSet} sizes={source.sizes} />
      <source type="image/webp" srcSet={source.srcSet} sizes={source.sizes} />
      <img
        alt={alt}
        src={source.src}
        srcSet={source.srcSet}
        sizes={source.sizes}
        width={source.width}
        height={source.height}
        loading="lazy"
        decoding="async"
        fetchPriority={fetchPriority}
        className={className}
      />
    </picture>
  );
}

/**
 * Replacement for Docusaurus `@theme/ThemedImage`.
 * Both images are rendered and `custom.css` shows the one matching `data-theme`.
 */
export default function ThemedImage({ alt, className, sources }: Props): React.JSX.Element {
  return (
    <>
      <ResponsiveImage
        source={sources.light}
        alt={alt}
        className={clsx(className, "themedImage--light")}
      />
      <ResponsiveImage
        source={sources.dark}
        alt={alt}
        className={clsx(className, "themedImage--dark")}
      />
    </>
  );
}
