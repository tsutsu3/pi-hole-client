import { Footer, Layout, Navbar } from "nextra-theme-docs";
import { ThemeToggle } from "@/components/theme-toggle";
import { Banner, Head } from "nextra/components";
import { getPageMap } from "nextra/page-map";
import Image from "next/image";
import "nextra-theme-docs/style.css";
import "./globals.css";
import { GitHubIcon } from "nextra/icons";

import type { Metadata } from "next";

export const metadata: Metadata = {
  title: "Pi-hole client",
  description:
    "Pi-hole client is a mobile application that allows you to manage your Pi-hole server from your smartphone.",
  keywords: [
    "Pi-hole",
    "adblock",
    "DNS sinkhole",
    "network",
    "client",
    "dashboard",
  ],
  authors: [{ name: "tsutsu3", url: "https://github.com/tsutsu3" }],
  creator: "tsutsu3",
  publisher: "Pi-hole client Project",
  icons: {
    icon: "/favicon.ico",
  },
  openGraph: {
    title: "Pi-hole client",
    description:
      "Manage your Pi-hole server easily from your smartphone with Pi-hole client.",
    url: "https://tsutsu3.github.io/pi-hole-client/",
    siteName: "Pi-hole client",
    images: [
      {
        url: "https://tsutsu3.github.io/pi-hole-client/feature-image-og.png",
        width: 1200,
        height: 630,
        alt: "Pi-hole client App Preview",
      },
    ],
    locale: "en_US",
    alternateLocale: ["ja_JP"],
    type: "website",
  },
  twitter: {
    card: "summary_large_image",
    title: "Pi-hole client",
    description:
      "Monitor and control your Pi-hole server with Pi-hole client for mobile.",
    images: ["https://tsutsu3.github.io/pi-hole-client/feature-image-og.png"],
    creator: "@_tsutsu3",
  },
  alternates: {
    canonical: "https://tsutsu3.github.io/pi-hole-client/",
    languages: {
      "en-US": "https://tsutsu3.github.io/pi-hole-client/",
      "ja-JP": "https://tsutsu3.github.io/pi-hole-client/ja",
    },
  },
};

const banner = <Banner storageKey="some-key">Nextra 4.0 is released 🎉</Banner>;

const navbar = (
  <Navbar
    logo={
      <>
        <Image
          src="/pi-hole-client-icon-large-round.svg"
          alt="Pi-hole client logo"
          width={24}
          height={24}
        />
        <span style={{ marginLeft: ".4em", fontWeight: 800 }}>
          Pi-hole client
        </span>
      </>
    }
    projectIcon={<GitHubIcon width={20} height={20} />}
    projectLink="https://github.com/tsutsu3/pi-hole-client"
    // Includes a Google Play Store icon and link, which is used for Play Store access (not for chat)
    chatLink="https://play.google.com/store/apps/details?id=io.github.tsutsu3.pi_hole_client"
    chatIcon={
      <Image
        src="/googleplay.svg"
        alt="google play"
        width={20}
        height={20}
        className="dark:invert"
      />
    }
  >
    <ThemeToggle />
  </Navbar>
);
const footer = <Footer>Copyright © {new Date().getFullYear()} tsutsu3</Footer>;

export default async function RootLayout({ children }) {
  return (
    <html
      // Not required, but good for SEO
      lang="en"
      // Required to be set
      dir="ltr"
      // Suggested by `next-themes` package https://github.com/pacocoursey/next-themes#with-app
      suppressHydrationWarning
    >
      <Head
      // ... Your additional head options
      >
        {/* Your additional tags should be passed as `children` of `<Head>` element */}
      </Head>
      <body>
        <Layout
          banner={banner}
          navbar={navbar}
          pageMap={await getPageMap()}
          docsRepositoryBase="https://github.com/tsutsu3/pi-hole-client/site"
          footer={footer}
          // ... Your additional layout options
        >
          {children}
        </Layout>
      </body>
    </html>
  );
}
