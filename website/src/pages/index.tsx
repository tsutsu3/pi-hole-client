import React from "react";

import Layout from "@theme/Layout";
import ThemedImage from "@theme/ThemedImage";
import styles from "./index.module.css";
import {
  BarChart,
  Book,
  FileCheck,
  List,
  Lock,
  Palette,
  Power,
  Server,
  Smartphone,
} from "lucide-react";
import clsx from "clsx";

import getGooglePlayImage from "@site/static/img/get-google-play.png";
import mockLightImage from "@site/static/img/light-mock.png";
import mockDarkImage from "@site/static/img/dark-mock.png";
import imgHomeTop from "@site/docs/user-manual/images/home/home-top.png";
import imgHomeTopDark from "@site/docs/user-manual/images/home/home-top-dark.png";
import imgLogsLive from "@site/docs/user-manual/images/logs/log-live-on.png";
import imgLogsLiveDark from "@site/docs/user-manual/images/logs/log-live-on-dark.png";
import imgLogDetails from "@site/docs/user-manual/images/logs/log-detail-allow.png";
import imgLogDetailsDark from "@site/docs/user-manual/images/logs/log-detail-allow-dark.png";
import imgStatsQueries from "@site/docs/user-manual/images/stats/queries-servers-top.png";
import imgStatsQueriesDark from "@site/docs/user-manual/images/stats/queries-servers-top-dark.png";
import imgStatsDomainsRed from "@site/docs/user-manual/images/stats/domain-bottom-red.png";
import imgStatsDomainsRedDark from "@site/docs/user-manual/images/stats/domain-bottom-red-dark.png";
import imgDomainsList from "@site/docs/user-manual/images/domains/domains.png";
import imgDomainsListDark from "@site/docs/user-manual/images/domains/domains-dark.png";
import imgServersList from "@site/docs/user-manual/images/settings/app-settings/servers.png";
import imgServersListDark from "@site/docs/user-manual/images/settings/app-settings/servers-dark.png";
import imgCreateConnection from "@site/docs/user-manual/images/settings/app-settings/create-a-connection.png";
import imgCreateConnectionDark from "@site/docs/user-manual/images/settings/app-settings/create-a-connection-dark.png";
import imgAdlists from "@site/docs/user-manual/images/settings/server-settings/adlists/adlists.png";
import imgAdlistsDark from "@site/docs/user-manual/images/settings/server-settings/adlists/adlists-dark.png";
import imgGravity from "@site/docs/user-manual/images/settings/server-settings/adlists/update-gravity.png";
import imgGravityDark from "@site/docs/user-manual/images/settings/server-settings/adlists/update-gravity-dark.png";
import imgGroups from "@site/docs/user-manual/images/settings/server-settings/groups-clients/groups.png";
import imgGroupsDark from "@site/docs/user-manual/images/settings/server-settings/groups-clients/groups-dark.png";
import imgServerInfo from "@site/docs/user-manual/images/settings/server-settings/pi-hole-server/pihole-server.png";
import imgServerInfoDark from "@site/docs/user-manual/images/settings/server-settings/pi-hole-server/pihole-server-dark.png";
import imgTheme from "@site/docs/user-manual/images/settings/app-settings/theme.png";
import imgThemeDark from "@site/docs/user-manual/images/settings/app-settings/theme-dark.png";

const features = [
  {
    id: "easy-management",
    icon: <Power size={28} />,
    title: "Easy Management",
    desc: "Quickly enable or disable your Pi-hole protection with a single tap from the dashboard.",
    detail:
      "Use the Home screen to check status and pause or resume blocking. Summary tiles jump to Logs and server tools so you can act without hunting through menus.",
    bullets: [
      "One-tap pause with a timed resume",
      "Status icon reflects connection and blocking state",
      "Tiles link directly to Logs and server tools",
    ],
    media: [{ src: imgHomeTop, srcDark: imgHomeTopDark, alt: "Home status and summary tiles" }],
  },
  {
    id: "v6-support",
    icon: <FileCheck size={28} />,
    title: "Pi-hole v6 Support",
    desc: "Full support for the latest Pi-hole v6, while maintaining compatibility with v5.",
    detail:
      "The app is built around the Pi-hole v6 API while keeping v5 compatibility for legacy installs. Features that require v6 are clearly scoped in the UI.",
    bullets: [
      "v6-first behavior and terminology",
      "v5 fallback for core status and logs",
      "Clear indicators when v6-only tools are unavailable",
    ],
    media: [
      { src: imgServerInfo, srcDark: imgServerInfoDark, alt: "Server info screen" },
      { src: imgGroups, srcDark: imgGroupsDark, alt: "Groups and clients screen" },
    ],
    mediaLayout: "stack",
  },
  {
    id: "secure-connection",
    icon: <Lock size={28} />,
    title: "Secure Connection",
    desc: "Connect securely to your Pi-hole server using HTTP or HTTPS for enhanced privacy.",
    detail:
      "Choose HTTP for local setups or HTTPS when your Pi-hole is served through a reverse proxy or TLS endpoint.",
    bullets: [
      "Optional subroute support (example: /pihole)",
      "Self-signed certificate toggle for HTTPS",
      "Connection validation before saving",
    ],
    media: [
      { src: imgCreateConnection, srcDark: imgCreateConnectionDark, alt: "Create a connection screen" },
      { src: imgServersList, srcDark: imgServersListDark, alt: "Servers list in App Settings" },
    ],
    mediaLayout: "grid",
  },
  {
    id: "statistics",
    icon: <BarChart size={28} />,
    title: "Detailed Statistics",
    desc: "Visualize detailed statistics with clear, dynamic charts to monitor network activity.",
    detail:
      "Charts and ranked lists help you understand top domains, clients, and upstream servers. Switch views to compare trends at a glance.",
    bullets: [
      "Queries, domains, clients, and DNS views",
      "Tap list rows to open filtered Logs",
      "Display mode toggle for charts vs lists",
    ],
    media: [{ src: imgStatsQueries, srcDark: imgStatsQueriesDark, alt: "Queries and servers chart" }],
  },
  {
    id: "multi-server",
    icon: <Server size={28} />,
    title: "Multiple Servers",
    desc: "Add multiple Pi-hole servers and manage them all conveniently from one place.",
    detail:
      "Keep a home Pi-hole and a remote Pi-hole in the same app. Switching servers updates all data and actions immediately.",
    bullets: [
      "Fast switch dialog from the Home header",
      "Per-server authentication and settings",
      "Default server selection",
    ],
    media: [{ src: imgServersList, srcDark: imgServersListDark, alt: "Multiple saved servers" }],
  },
  {
    id: "query-logs",
    icon: <Book size={28} />,
    title: "Query Logs",
    desc: "Explore query logs and access detailed information about your network traffic.",
    detail:
      "Filter by time, status, and client. Use Live mode for real-time troubleshooting or pause it for stable review.",
    bullets: [
      "Live mode with resume/pause controls",
      "Manual refresh when Live Log is disabled",
      "One-tap whitelist or blacklist from details",
    ],
    media: [
      { src: imgLogsLive, srcDark: imgLogsLiveDark, alt: "Live log view" },
      { src: imgLogDetails, srcDark: imgLogDetailsDark, alt: "Log entry details" },
    ],
  },
  {
    id: "domain-management",
    icon: <List size={28} />,
    title: "Domain List Management",
    desc: "Easily add or remove domains from your whitelist or blacklist to customize filtering.",
    detail:
      "Manage explicit allowlist and denylist entries with clear status and grouping support (v6).",
    bullets: [
      "Whitelist/blacklist tabs",
      "Optional wildcard rules for subdomains",
      "Per-rule enable/disable on v6",
    ],
    media: [{ src: imgDomainsList, srcDark: imgDomainsListDark, alt: "Domains list screen" }],
  },
  {
    id: "adlists",
    icon: <Smartphone size={28} />,
    title: "Update Adlists",
    desc: "Update your adlists and apply changes directly from within the mobile application.",
    detail: "Subscribe to allowlist and blocklist sources, then rebuild gravity to apply changes.",
    bullets: [
      "Allowlist and blocklist subscriptions",
      "Gravity update action with status",
      "List detail views for review",
    ],
    media: [
      { src: imgAdlists, srcDark: imgAdlistsDark, alt: "Adlists screen" },
      { src: imgGravity, srcDark: imgGravityDark, alt: "Update gravity screen" },
    ],
  },
  {
    id: "material-you",
    icon: <Palette size={28} />,
    title: "Material You Interface",
    desc: "Enjoy a modern interface with dynamic theming on Android 12 and higher.",
    detail:
      "A clean layout, consistent typography, and responsive layouts across phone and tablet sizes.",
    bullets: [
      "Dynamic color on supported Android versions",
      "Light and dark themes",
      "Responsive layouts",
    ],
    media: [
      { src: imgTheme, srcDark: imgThemeDark, alt: "Theme pages" },
      { src: imgStatsDomainsRed, srcDark: imgStatsDomainsRedDark, alt: "Domains chart with red theme" },
    ],
  },
];

const FeatureCard = ({
  id,
  icon,
  title,
  desc,
  colorClass,
}: {
  id: string;
  icon: React.JSX.Element;
  title: string;
  desc: string;
  colorClass: string;
}) => {
  return (
    <a className={styles.featureCard} href={`#${id}`}>
      <div className={styles.featureCardHeader}>
        <div className={clsx(styles.featureCardIcon, styles[colorClass])}>{icon}</div>
        <div className={styles.featureCardTitle}>{title}</div>
      </div>
      <div className={styles.featureCardDesc}>{desc}</div>
    </a>
  );
};

const FeatureSection = () => {
  const colors = ["chart1", "chart2", "chart3", "chart4"];

  return (
    <section className={styles.featuresSection} id="features">
      <h2 className={styles.featuresTitle}>Features</h2>
      <div className={styles.featuresGrid}>
        {features.map((f, index) => (
          <React.Fragment key={f.title}>
            <FeatureCard
              id={f.id}
              icon={f.icon}
              title={f.title}
              desc={f.desc}
              colorClass={colors[index % colors.length]}
            />
          </React.Fragment>
        ))}
      </div>
      <div className={styles.featuresDetails}>
        <h3 className={styles.featuresDetailsTitle}>Feature details</h3>
        {features.map((feature, index) => {
          const isReversed = index % 2 === 1;
          return (
            <section
              key={feature.id}
              id={feature.id}
              className={clsx(styles.featureDetail, isReversed && styles.featureDetailReverse)}
            >
              <div className={styles.featureDetailContent}>
                <div className={styles.featureDetailHeader}>
                  <div className={clsx(styles.featureCardIcon, styles[colors[index % colors.length]])}>
                    {feature.icon}
                  </div>
                  <h4 className={styles.featureDetailTitle}>{feature.title}</h4>
                </div>
                <p className={styles.featureDetailDesc}>{feature.detail}</p>
                <ul className={styles.featureDetailList}>
                  {feature.bullets.map((item) => (
                    <li key={item}>{item}</li>
                  ))}
                </ul>
                <a className={styles.backToFeatures} href="#features">
                  ↑ Back to features
                </a>
              </div>
              <div className={styles.featureDetailMedia}>
                <div
                  className={clsx(
                    styles.featureDetailMediaGrid,
                    feature.mediaLayout === "grid" && styles.featureDetailMediaGridCompact,
                    feature.mediaLayout === "stack" && styles.featureDetailMediaStack,
                  )}
                >
                  {feature.media.map((item) => (
                    // <img key={item.src} src={item.src} alt={item.alt} />
                    <ThemedImage
                      key={item.src}
                      alt={item.alt}
                      className={styles.heroMockImg}
                      sources={{
                        light: item.src,
                        dark: item.srcDark || item.src,
                      }}
                    />
                  ))}
                </div>
              </div>
            </section>
          );
        })}
      </div>
    </section>
  );
};

const HeroSection = () => {
  return (
    <section className={styles.heroSection}>
      <div className={styles.heroBgGrid}></div>
      <div className={styles.heroText}>
        <h1>
          <span className={styles.heroGradientTitle}>Take Control</span> of Your Network
        </h1>
        <p>
          The unofficial Pi-hole client for Android. Monitor and manage your Pi-hole on your home
          network with a clean, modern interface.
        </p>
        <a
          className={styles.heroBtn}
          href="https://play.google.com/store/apps/details?id=io.github.tsutsu3.pi_hole_client"
          target="_blank"
          rel="noopener noreferrer"
        >
          <img
            src={getGooglePlayImage}
            alt="Get it on Google Play"
            className={styles.heroPlayBtn}
          />
        </a>
      </div>
      <div className={styles.heroImage}>
        <ThemedImage
          alt="Pi-hole Client"
          className={styles.heroMockImg}
          sources={{
            light: mockLightImage,
            dark: mockDarkImage,
          }}
        />
      </div>
    </section>
  );
};

export default function Home() {
  return (
    <Layout
      title="Pi-hole Client"
      description="The unofficial Pi-hole client for Android. Monitor and manage your Pi-hole on your home network with a clean, modern interface."
    >
      <main>
        <HeroSection />
        <FeatureSection />
      </main>
    </Layout>
  );
}
