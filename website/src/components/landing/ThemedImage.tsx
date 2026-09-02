import React from "react";
import clsx from "clsx";

type Props = {
  readonly alt: string;
  readonly className?: string;
  readonly sources: { light: string; dark: string };
};

/**
 * Replacement for Docusaurus `@theme/ThemedImage`.
 * Both images are rendered and `custom.css` shows the one matching `data-theme`.
 */
export default function ThemedImage({ alt, className, sources }: Props): React.JSX.Element {
  return (
    <>
      <img alt={alt} src={sources.light} className={clsx(className, "themedImage--light")} />
      <img alt={alt} src={sources.dark} className={clsx(className, "themedImage--dark")} />
    </>
  );
}
