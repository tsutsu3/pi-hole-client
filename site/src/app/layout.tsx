import "./globals.css";
import googlePlayImg from "@/../public/googleplay.svg";
import appImg from "@/../public/pi-hole-client-icon-large-round.svg";
import { ThemeToggle } from "@/components/theme-toggle";
import { GITHUB_URL, PIHOLE_CLIENT_VERSION, PLAY_STORE_URL, WEBSITE_URL } from "@/lib/constants";
import type { Metadata } from "next";
import Image from "next/image";
import { Footer, Layout, Navbar } from "nextra-theme-docs";
import "nextra-theme-docs/style.css";
import { Banner, Head } from "nextra/components";
import { GitHubIcon } from "nextra/icons";
import { getPageMap } from "nextra/page-map";
import { ReactNode } from "react";

type RootLayoutProps = {
  readonly children: ReactNode;
};

export const metadata: Metadata = {
  title: "Pi-hole client",
  description:
    "Pi-hole client is a mobile application that allows you to manage your Pi-hole server from your smartphone.",
  keywords: ["Pi-hole", "adblock", "DNS sinkhole", "network", "client", "dashboard"],
  authors: [{ name: "tsutsu3", url: "https://github.com/tsutsu3" }],
  creator: "tsutsu3",
  publisher: "Pi-hole client Project",
  openGraph: {
    title: "Pi-hole client",
    description: "Manage your Pi-hole server easily from your smartphone with Pi-hole client.",
    url: WEBSITE_URL,
    siteName: "Pi-hole client",
    images: [
      {
        url: `${WEBSITE_URL}/feature-image-og.png`,
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
    description: "Monitor and control your Pi-hole server with Pi-hole client for mobile.",
    images: [`${WEBSITE_URL}/feature-image-og.png`],
    creator: "@_tsutsu3",
  },
  alternates: {
    canonical: WEBSITE_URL,
    languages: {
      "en-US": `${WEBSITE_URL}/`,
      "ja-JP": `${WEBSITE_URL}/ja`,
    },
  },
};

const banner = <Banner>Pi-hole client {PIHOLE_CLIENT_VERSION} is released 🎉</Banner>;

const navbar = (
  <Navbar
    logo={
      <>
        <Image src={appImg} alt="Pi-hole client logo" width={24} height={24} />
        <span style={{ marginLeft: ".4em", fontWeight: 800 }}>Pi-hole client</span>
      </>
    }
    projectIcon={<GitHubIcon width={20} height={20} />}
    projectLink={GITHUB_URL}
    // Includes a Google Play Store icon and link, which is used for Play Store access (not for chat)
    chatLink={PLAY_STORE_URL}
    chatIcon={
      <Image src={googlePlayImg} alt="google play" width={20} height={20} className="dark:invert" />
    }
  >
    <ThemeToggle />
  </Navbar>
);
const footer = <Footer>Copyright © {new Date().getFullYear()} tsutsu3</Footer>;

export default async function RootLayout({ children }: RootLayoutProps) {
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
          docsRepositoryBase={`${GITHUB_URL}/tree/main/site`}
          footer={footer}
          // ... Your additional layout options
        >
          {children}
        </Layout>
      </body>
    </html>
  );
}
