import React from "react";
import clsx from "clsx";

export type ResponsiveImageSource = {
  readonly src: string;
  readonly srcSet: string;
  readonly sizes: string;
  readonly width: number;
  readonly height: number;
};

type Props = {
  readonly alt: string;
  readonly className?: string;
  readonly loading?: "eager" | "lazy";
  readonly sources: { light: ResponsiveImageSource; dark: ResponsiveImageSource };
};

/**
 * Replacement for Docusaurus `@theme/ThemedImage`.
 * Both images are rendered and `custom.css` shows the one matching `data-theme`.
 */
export default function ThemedImage({
  alt,
  className,
  loading = "lazy",
  sources,
}: Props): React.JSX.Element {
  return (
    <>
      <img
        alt={alt}
        src={sources.light.src}
        srcSet={sources.light.srcSet}
        sizes={sources.light.sizes}
        width={sources.light.width}
        height={sources.light.height}
        loading={loading}
        decoding="async"
        className={clsx(className, "themedImage--light")}
      />
      <img
        alt={alt}
        src={sources.dark.src}
        srcSet={sources.dark.srcSet}
        sizes={sources.dark.sizes}
        width={sources.dark.width}
        height={sources.dark.height}
        loading={loading}
        decoding="async"
        className={clsx(className, "themedImage--dark")}
      />
    </>
  );
}
