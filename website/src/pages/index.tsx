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

const features = [
  {
    icon: <Power size={28} />,
    title: "Easy Management",
    desc: "Quickly enable or disable your Pi-hole protection with a single tap from the dashboard.",
  },
  {
    icon: <FileCheck size={28} />,
    title: "Pi-hole v6 Support",
    desc: "Full support for the latest Pi-hole v6, while maintaining compatibility with v5.",
  },
  {
    icon: <Lock size={28} />,
    title: "Secure Connection",
    desc: "Connect securely to your Pi-hole server using HTTP or HTTPS for enhanced privacy.",
  },
  {
    icon: <BarChart size={28} />,
    title: "Detailed Statistics",
    desc: "Visualize detailed statistics with clear, dynamic charts to monitor network activity.",
  },
  {
    icon: <Server size={28} />,
    title: "Multiple Servers",
    desc: "Add multiple Pi-hole servers and manage them all conveniently from one place.",
  },
  {
    icon: <Book size={28} />,
    title: "Query Logs",
    desc: "Explore query logs and access detailed information about your network traffic.",
  },
  {
    icon: <List size={28} />,
    title: "Domain List Management",
    desc: "Easily add or remove domains from your whitelist or blacklist to customize filtering.",
  },
  {
    icon: <Smartphone size={28} />,
    title: "Update Adlists",
    desc: "Update your adlists and apply changes directly from within the mobile application.",
  },
  {
    icon: <Palette size={28} />,
    title: "Material You Interface",
    desc: "Enjoy a modern interface with dynamic theming on Android 12 and higher.",
  },
];

const FeatureCard = ({
  icon,
  title,
  desc,
  colorClass,
}: {
  icon: React.JSX.Element;
  title: string;
  desc: string;
  colorClass: string;
}) => {
  return (
    <div className={styles.featureCard}>
      <div className={styles.featureCardHeader}>
        <div className={clsx(styles.featureCardIcon, styles[colorClass])}>{icon}</div>
        <div className={styles.featureCardTitle}>{title}</div>
      </div>
      <div className={styles.featureCardDesc}>{desc}</div>
    </div>
  );
};

const FeatureSection = () => {
  const colors = ["chart1", "chart2", "chart3", "chart4"];

  return (
    <section className={styles.featuresSection}>
      <h2 className={styles.featuresTitle}>Features</h2>
      <div className={styles.featuresGrid}>
        {features.map((f, index) => (
          <React.Fragment key={f.title}>
            <FeatureCard
              icon={f.icon}
              title={f.title}
              desc={f.desc}
              colorClass={colors[index % colors.length]}
            />
          </React.Fragment>
        ))}
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
