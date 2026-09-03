import React from "react";

import ThemedImage from "./ThemedImage";
import styles from "./landing.module.css";
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

import getGooglePlayImage from "@site/src/assets/get-google-play.png";
import mockLightImage from "@site/src/assets/light-mock.png";
import mockDarkImage from "@site/src/assets/dark-mock.png";
import imgHomeTop from "@site/src/content/docs/docs/user-manual/images/home/home-top.png";
import imgHomeTopDark from "@site/src/content/docs/docs/user-manual/images/home/home-top-dark.png";
import imgLogsLive from "@site/src/content/docs/docs/user-manual/images/logs/log-live-on.png";
import imgLogsLiveDark from "@site/src/content/docs/docs/user-manual/images/logs/log-live-on-dark.png";
import imgLogDetails from "@site/src/content/docs/docs/user-manual/images/logs/log-detail-allow.png";
import imgLogDetailsDark from "@site/src/content/docs/docs/user-manual/images/logs/log-detail-allow-dark.png";
import imgStatsQueries from "@site/src/content/docs/docs/user-manual/images/stats/queries-servers-top.png";
import imgStatsQueriesDark from "@site/src/content/docs/docs/user-manual/images/stats/queries-servers-top-dark.png";
import imgStatsDomainsRed from "@site/src/content/docs/docs/user-manual/images/stats/domain-bottom-red.png";
import imgStatsDomainsRedDark from "@site/src/content/docs/docs/user-manual/images/stats/domain-bottom-red-dark.png";
import imgDomainsList from "@site/src/content/docs/docs/user-manual/images/domains/domains.png";
import imgDomainsListDark from "@site/src/content/docs/docs/user-manual/images/domains/domains-dark.png";
import imgServersList from "@site/src/content/docs/docs/user-manual/images/settings/app-settings/servers.png";
import imgServersListDark from "@site/src/content/docs/docs/user-manual/images/settings/app-settings/servers-dark.png";
import imgCreateConnection from "@site/src/content/docs/docs/user-manual/images/settings/app-settings/create-a-connection.png";
import imgCreateConnectionDark from "@site/src/content/docs/docs/user-manual/images/settings/app-settings/create-a-connection-dark.png";
import imgAdlists from "@site/src/content/docs/docs/user-manual/images/settings/server-settings/adlists/adlists.png";
import imgAdlistsDark from "@site/src/content/docs/docs/user-manual/images/settings/server-settings/adlists/adlists-dark.png";
import imgGravity from "@site/src/content/docs/docs/user-manual/images/settings/server-settings/adlists/update-gravity.png";
import imgGravityDark from "@site/src/content/docs/docs/user-manual/images/settings/server-settings/adlists/update-gravity-dark.png";
import imgGroups from "@site/src/content/docs/docs/user-manual/images/settings/server-settings/groups-clients/groups.png";
import imgGroupsDark from "@site/src/content/docs/docs/user-manual/images/settings/server-settings/groups-clients/groups-dark.png";
import imgServerInfo from "@site/src/content/docs/docs/user-manual/images/settings/server-settings/pi-hole-server/pihole-server.png";
import imgServerInfoDark from "@site/src/content/docs/docs/user-manual/images/settings/server-settings/pi-hole-server/pihole-server-dark.png";
import imgTheme from "@site/src/content/docs/docs/user-manual/images/settings/app-settings/theme.png";
import imgThemeDark from "@site/src/content/docs/docs/user-manual/images/settings/app-settings/theme-dark.png";

type Locale = "en" | "ja";

const featuresByLocale = {
  en: [
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
        {
          src: imgCreateConnection,
          srcDark: imgCreateConnectionDark,
          alt: "Create a connection screen",
        },
        { src: imgServersList, srcDark: imgServersListDark, alt: "Servers list in App Settings" },
      ],
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
      media: [
        { src: imgStatsQueries, srcDark: imgStatsQueriesDark, alt: "Queries and servers chart" },
      ],
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
      detail:
        "Subscribe to allowlist and blocklist sources, then rebuild gravity to apply changes.",
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
        {
          src: imgStatsDomainsRed,
          srcDark: imgStatsDomainsRedDark,
          alt: "Domains chart with red theme",
        },
      ],
    },
  ],
  ja: [
    {
      id: "easy-management",
      icon: <Power size={28} />,
      title: "かんたん操作",
      desc: "ダッシュボードからワンタップで、Pi-holeのブロック機能をすばやく切り替えられます。",
      detail:
        "ホーム画面で稼働状況を確認し、ブロックを一時停止・再開できます。概要タイルからログやサーバーツールへ直接移動できるため、必要な操作にすぐアクセスできます。",
      bullets: [
        "時間を指定できるワンタップ一時停止",
        "接続状態とブロック状態がひと目でわかるステータス表示",
        "ログやサーバーツールへ直接移動できる概要タイル",
      ],
      media: [
        { src: imgHomeTop, srcDark: imgHomeTopDark, alt: "ホーム画面のステータスと概要タイル" },
      ],
    },
    {
      id: "v6-support",
      icon: <FileCheck size={28} />,
      title: "Pi-hole v6対応",
      desc: "最新のPi-hole v6をフルサポートしながら、v5との互換性も維持しています。",
      detail:
        "Pi-hole v6 APIを中心に設計しつつ、従来の環境向けにv5にも対応しています。v6が必要な機能は、アプリ内でわかりやすく案内します。",
      bullets: [
        "v6に最適化した操作と用語",
        "基本ステータスとログはv5にも対応",
        "v6専用機能を利用できない場合は明確に表示",
      ],
      media: [
        { src: imgServerInfo, srcDark: imgServerInfoDark, alt: "サーバー情報画面" },
        { src: imgGroups, srcDark: imgGroupsDark, alt: "グループとクライアント画面" },
      ],
    },
    {
      id: "secure-connection",
      icon: <Lock size={28} />,
      title: "セキュアな接続",
      desc: "HTTPまたはHTTPSを使って、Pi-holeサーバーへ安全に接続できます。",
      detail:
        "ローカル環境ではHTTP、リバースプロキシやTLSエンドポイントを利用する環境ではHTTPSを選択できます。",
      bullets: [
        "サブパスに対応（例：/pihole）",
        "HTTPS接続用の自己署名証明書オプション",
        "保存前に接続を検証",
      ],
      media: [
        {
          src: imgCreateConnection,
          srcDark: imgCreateConnectionDark,
          alt: "接続の作成画面",
        },
        {
          src: imgServersList,
          srcDark: imgServersListDark,
          alt: "アプリ設定のサーバー一覧",
        },
      ],
    },
    {
      id: "statistics",
      icon: <BarChart size={28} />,
      title: "詳細な統計",
      desc: "見やすく動的なグラフで、ネットワークの利用状況を詳しく確認できます。",
      detail:
        "グラフとランキングから、よく利用されるドメイン、クライアント、上流DNSサーバーを把握できます。表示を切り替えて、傾向をすばやく比較できます。",
      bullets: [
        "クエリ、ドメイン、クライアント、DNSの各ビュー",
        "一覧から絞り込み済みのログへ移動",
        "グラフ表示とリスト表示の切り替え",
      ],
      media: [
        { src: imgStatsQueries, srcDark: imgStatsQueriesDark, alt: "クエリとサーバーのグラフ" },
      ],
    },
    {
      id: "multi-server",
      icon: <Server size={28} />,
      title: "複数サーバー",
      desc: "複数のPi-holeサーバーを登録し、ひとつのアプリからまとめて管理できます。",
      detail:
        "自宅用とリモート用など、複数のPi-holeを同じアプリに登録できます。サーバーを切り替えると、すべてのデータと操作がすぐに切り替わります。",
      bullets: [
        "ホーム画面からすばやくサーバーを切り替え",
        "サーバーごとの認証情報と設定",
        "既定のサーバーを選択可能",
      ],
      media: [{ src: imgServersList, srcDark: imgServersListDark, alt: "登録済みサーバーの一覧" }],
    },
    {
      id: "query-logs",
      icon: <Book size={28} />,
      title: "クエリログ",
      desc: "クエリログを確認し、ネットワーク通信の詳細な情報にアクセスできます。",
      detail:
        "時刻、ステータス、クライアントでログを絞り込めます。リアルタイムのトラブルシューティングにはライブモード、落ち着いて確認するときは一時停止を利用できます。",
      bullets: [
        "再開・一時停止できるライブモード",
        "ライブログ停止中の手動更新",
        "詳細画面から許可リスト・拒否リストへワンタップで追加",
      ],
      media: [
        { src: imgLogsLive, srcDark: imgLogsLiveDark, alt: "ライブログ画面" },
        { src: imgLogDetails, srcDark: imgLogDetailsDark, alt: "ログ項目の詳細" },
      ],
    },
    {
      id: "domain-management",
      icon: <List size={28} />,
      title: "ドメインリスト管理",
      desc: "許可・拒否するドメインを手軽に追加、削除して、フィルタリングを調整できます。",
      detail:
        "許可リストと拒否リストの項目をわかりやすく管理できます。Pi-hole v6ではグループ設定にも対応しています。",
      bullets: [
        "許可リストと拒否リストのタブ表示",
        "サブドメインを対象にできるワイルドカードルール",
        "v6ではルールごとに有効・無効を切り替え可能",
      ],
      media: [{ src: imgDomainsList, srcDark: imgDomainsListDark, alt: "ドメインリスト画面" }],
    },
    {
      id: "adlists",
      icon: <Smartphone size={28} />,
      title: "Adlistの更新",
      desc: "モバイルアプリからAdlistを更新し、変更内容を直接反映できます。",
      detail: "許可リストとブロックリストの配信元を登録し、Gravityを再構築して変更を反映できます。",
      bullets: [
        "許可リストとブロックリストの購読",
        "進行状況を確認できるGravity更新",
        "内容を確認できるリスト詳細画面",
      ],
      media: [
        { src: imgAdlists, srcDark: imgAdlistsDark, alt: "Adlist画面" },
        { src: imgGravity, srcDark: imgGravityDark, alt: "Gravityの更新画面" },
      ],
    },
    {
      id: "material-you",
      icon: <Palette size={28} />,
      title: "Material Youデザイン",
      desc: "Android 12以降では、ダイナミックカラーに対応したモダンな画面を楽しめます。",
      detail:
        "すっきりしたレイアウトと統一感のある文字組みで、スマートフォンからタブレットまで快適に使えます。",
      bullets: [
        "対応するAndroid端末のダイナミックカラー",
        "ライトテーマとダークテーマ",
        "画面サイズに合わせたレスポンシブ表示",
      ],
      media: [
        { src: imgTheme, srcDark: imgThemeDark, alt: "テーマ設定画面" },
        {
          src: imgStatsDomainsRed,
          srcDark: imgStatsDomainsRedDark,
          alt: "赤いテーマのドメイングラフ",
        },
      ],
    },
  ],
} as const;

const pageText = {
  en: {
    featuresTitle: "Features",
    featureDetailsTitle: "Feature details",
    backToFeatures: "↑ Back to features",
    heroTitleAccent: "Take Control",
    heroTitleRest: " of Your Network",
    heroDescription:
      "The unofficial Pi-hole client for Android. Monitor and manage your Pi-hole on your home network with a clean, modern interface.",
    playStoreAlt: "Get it on Google Play",
    mockupAlt: "Pi-hole Client",
  },
  ja: {
    featuresTitle: "主な機能",
    featureDetailsTitle: "機能の詳細",
    backToFeatures: "↑ 機能一覧へ戻る",
    heroTitleAccent: "ネットワークを",
    heroTitleRest: "もっと自由に",
    heroDescription:
      "Android向けの非公式Pi-holeクライアント。すっきりとしたモダンな画面から、自宅ネットワーク上のPi-holeをいつでも確認・管理できます。",
    playStoreAlt: "Google Playで手に入れよう",
    mockupAlt: "Pi-hole Clientのアプリ画面",
  },
} as const;

function createKey(text: string, index: number) {
  return `${text.replaceAll(/\s+/g, "_").toLowerCase()}_${index}`;
}

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

const FeatureSection = ({ locale }: { locale: Locale }) => {
  const colors = ["chart1", "chart2", "chart3", "chart4"];
  const features = featuresByLocale[locale];
  const text = pageText[locale];

  return (
    <section className={styles.featuresSection} id="features">
      <h2 className={styles.featuresTitle}>{text.featuresTitle}</h2>
      <div className={styles.featuresGrid}>
        {features.map((f, index) => (
          <React.Fragment key={f.id}>
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
        <h3 className={styles.featuresDetailsTitle}>{text.featureDetailsTitle}</h3>
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
                  <div
                    className={clsx(styles.featureCardIcon, styles[colors[index % colors.length]])}
                  >
                    {feature.icon}
                  </div>
                  <h4 className={styles.featureDetailTitle}>{feature.title}</h4>
                </div>
                <p className={styles.featureDetailDesc}>{feature.detail}</p>
                <ul className={styles.featureDetailList}>
                  {feature.bullets.map((item, index) => (
                    <li key={createKey(item, index)}>{item}</li>
                  ))}
                </ul>
                <a className={styles.backToFeatures} href="#features">
                  {text.backToFeatures}
                </a>
              </div>
              <div className={styles.featureDetailMedia}>
                <div className={clsx(styles.featureDetailMediaGrid)}>
                  {feature.media.map((item) => (
                    <ThemedImage
                      key={item.src.src}
                      alt={item.alt}
                      className={styles.featureDetailImage}
                      sources={{
                        light: item.src.src,
                        dark: (item.srcDark ?? item.src).src,
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

const HeroSection = ({ locale }: { locale: Locale }) => {
  const text = pageText[locale];

  return (
    <section className={styles.heroSection}>
      <div className={styles.heroBgGrid}></div>
      <div className={styles.heroText}>
        {/* `_top` is Starlight PAGE_TITLE_ID: the skip link and back-to-top target. */}
        <h1 id="_top">
          <span className={styles.heroGradientTitle}>{text.heroTitleAccent}</span>
          {text.heroTitleRest}
        </h1>
        <p>{text.heroDescription}</p>
        <a
          className={styles.heroBtn}
          href="https://play.google.com/store/apps/details?id=io.github.tsutsu3.pi_hole_client"
          target="_blank"
          rel="noopener noreferrer"
        >
          <img
            src={getGooglePlayImage.src}
            alt={text.playStoreAlt}
            className={styles.heroPlayBtn}
          />
        </a>
      </div>
      <div className={styles.heroImage}>
        <ThemedImage
          alt={text.mockupAlt}
          className={styles.heroMockImg}
          sources={{
            light: mockLightImage.src,
            dark: mockDarkImage.src,
          }}
        />
      </div>
    </section>
  );
};

export default function LandingPage({ locale = "en" }: { locale?: Locale }): React.JSX.Element {
  return (
    <>
      <HeroSection locale={locale} />
      <FeatureSection locale={locale} />
    </>
  );
}
