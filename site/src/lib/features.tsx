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
import { JSX } from "react";

export type Feature = {
  slug: string;
  icon: JSX.Element;
  titleKey: string;
  descriptionKey: string;
  longDescriptionKey: string;
  screenshot: string;
  screenshotHint: string;
};

const appScreenshot =
  "https://play-lh.googleusercontent.com/HrDnQ0zWFSP3ckj-q49NVXSDKNgjqB2-EyCxoOlFpR2Pfg4CzQQtUqsLIAqb_gwp940=w5120-h2880";

export const features: Feature[] = [
  {
    slug: "easy-management",
    icon: <Power size={28} />,
    titleKey: "features.easyManagement.title",
    descriptionKey: "features.easyManagement.description",
    longDescriptionKey: "features.easyManagement.longDescription",
    screenshot: appScreenshot,
    screenshotHint: "app dashboard",
  },
  {
    slug: "pi-hole-v6-support",
    icon: <FileCheck size={28} />,
    titleKey: "features.piholeV6Support.title",
    descriptionKey: "features.piholeV6Support.description",
    longDescriptionKey: "features.piholeV6Support.longDescription",
    screenshot: appScreenshot,
    screenshotHint: "settings screen",
  },
  {
    slug: "secure-connection",
    icon: <Lock size={28} />,
    titleKey: "features.secureConnection.title",
    descriptionKey: "features.secureConnection.description",
    longDescriptionKey: "features.secureConnection.longDescription",
    screenshot: appScreenshot,
    screenshotHint: "connection setup",
  },
  {
    slug: "detailed-statistics",
    icon: <BarChart size={28} />,
    titleKey: "features.detailedStatistics.title",
    descriptionKey: "features.detailedStatistics.description",
    longDescriptionKey: "features.detailedStatistics.longDescription",
    screenshot: appScreenshot,
    screenshotHint: "statistics chart",
  },
  {
    slug: "multiple-servers",
    icon: <Server size={28} />,
    titleKey: "features.multipleServers.title",
    descriptionKey: "features.multipleServers.description",
    longDescriptionKey: "features.multipleServers.longDescription",
    screenshot: appScreenshot,
    screenshotHint: "server list",
  },
  {
    slug: "query-logs",
    icon: <Book size={28} />,
    titleKey: "features.queryLogs.title",
    descriptionKey: "features.queryLogs.description",
    longDescriptionKey: "features.queryLogs.longDescription",
    screenshot: appScreenshot,
    screenshotHint: "query log",
  },
  {
    slug: "domain-list-management",
    icon: <List size={28} />,
    titleKey: "features.domainListManagement.title",
    descriptionKey: "features.domainListManagement.description",
    longDescriptionKey: "features.domainListManagement.longDescription",
    screenshot: appScreenshot,
    screenshotHint: "domain management",
  },
  {
    slug: "update-adlists",
    icon: <Smartphone size={28} />,
    titleKey: "features.updateAdlists.title",
    descriptionKey: "features.updateAdlists.description",
    longDescriptionKey: "features.updateAdlists.longDescription",
    screenshot: appScreenshot,
    screenshotHint: "settings screen update",
  },
  {
    slug: "material-you-interface",
    icon: <Palette size={28} />,
    titleKey: "features.materialYou.title",
    descriptionKey: "features.materialYou.description",
    longDescriptionKey: "features.materialYou.longDescription",
    screenshot: appScreenshot,
    screenshotHint: "app themes",
  },
];
