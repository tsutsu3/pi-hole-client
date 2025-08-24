"use client";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { features, Feature } from "@/lib/features";

const featureTranslations: Record<
  string,
  { title: string; description: string; longDescription: string }
> = {
  "features.easyManagement": {
    title: "Easy Management",
    description:
      "Quickly enable or disable your Pi-hole protection with a single tap from the dashboard.",
    longDescription:
      "Instantly enable or disable Pi-hole's protection with a single tap from the dashboard. This gives you immediate control over your network's ad-blocking, perfect for when you need to temporarily access blocked content without changing settings.",
  },
  "features.piholeV6Support": {
    title: "Pi-hole v6 Support",
    description:
      "Full support for the latest Pi-hole v6, while maintaining compatibility with v5.",
    longDescription:
      "Keep up with the latest evolution of Pi-hole. This client is fully optimized for Pi-hole v6, ensuring you can leverage the newest features and performance improvements, while still providing robust support for v5 users.",
  },
  "features.secureConnection": {
    title: "Secure Connection",
    description:
      "Connect securely to your Pi-hole server using HTTP or HTTPS for enhanced privacy.",
    longDescription:
      "Your privacy and security are paramount. This app allows you to connect to your Pi-hole server securely over HTTPS, encrypting the data sent between your device and the server to prevent snooping and ensure your network management is safe.",
  },
  "features.detailedStatistics": {
    title: "Detailed Statistics",
    description:
      "Visualize detailed statistics with clear, dynamic charts to monitor network activity.",
    longDescription:
      "Get insights into your network's performance with comprehensive and easy-to-read charts. Track total queries, blocked queries, and see trends over time to understand your internet usage and Pi-hole's effectiveness.",
  },
  "features.multipleServers": {
    title: "Multiple Servers",
    description:
      "Add multiple Pi-hole servers and manage them all conveniently from one place.",
    longDescription:
      "For users running multiple Pi-hole instances, like one for home and one for work, this feature is a lifesaver. Add different servers and switch between them seamlessly, allowing you to manage settings and monitor activity for each without logging in and out.",
  },
  "features.queryLogs": {
    title: "Query Logs",
    description:
      "Explore query logs and access detailed information about your network traffic.",
    longDescription:
      "Dig deep into your network traffic. The query log viewer lets you see every DNS request made on your network, showing you what's been blocked and what's been allowed. Search, filter, and investigate individual queries to troubleshoot issues or satisfy your curiosity.",
  },
  "features.domainListManagement": {
    title: "Domain List Management",
    description:
      "Easily add or remove domains from your whitelist or blacklist to customize filtering.",
    longDescription:
      "Take full control of your filtering rules on the go. Whether you need to quickly allow a site that's being blocked or add a new ad domain to the blacklist, you can manage your whitelists and blacklists directly from a simple, intuitive interface.",
  },
  "features.updateAdlists": {
    title: "Update Adlists",
    description:
      "Update your adlists and apply changes directly from within the mobile application.",
    longDescription:
      "Keep your ad-blocking lists up-to-date with a single tap. Trigger an update of the ad lists on your Pi-hole server to ensure you always have the latest protection against new advertisers and trackers.",
  },
  "features.materialYou": {
    title: "Material You Interface",
    description:
      "Enjoy a modern interface with dynamic theming on Android 12 and higher.",
    longDescription:
      "Experience a visually stunning and personalized interface. On devices with Android 12 or higher, the app uses Material You to adapt its color palette to your phone's wallpaper, creating a unique and beautiful user experience that's all your own.",
  },
};

export function Features() {
  const colors = [
    "text-chart-1",
    "text-chart-2",
    "text-chart-3",
    "text-chart-4",
  ];
  return (
    <section id="features" className="container py-24 sm:py-32 space-y-8">
      <h2 className="text-3xl lg:text-4xl font-bold md:text-center">
        Features
      </h2>
      <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-8">
        {features.map((feature: Feature, index) => {
          const translationKey = feature.titleKey.replace(".title", "");
          const translated = featureTranslations[translationKey] || {
            title: "Feature",
            description: "Description",
            longDescription: "Long Description",
          };
          const colorClass = colors[index % colors.length];

          return (
            <Card
              key={feature.slug}
              className="bg-card/50 hover:bg-accent/10 transition-colors w-full flex flex-col"
            >
              <CardHeader>
                <div className="flex items-center gap-4">
                  <div className={colorClass}>{feature.icon}</div>
                  <CardTitle className="text-xl">{translated.title}</CardTitle>
                </div>
              </CardHeader>
              <CardContent className="flex-grow">
                <p className="text-muted-foreground">
                  {translated.description}
                </p>
              </CardContent>
            </Card>

            // TODO: Images and layou
            // <Dialog key={feature.slug}>
            //   <DialogTrigger asChild>
            //     <Card className="bg-card/50 hover:bg-accent/10 transition-colors w-full cursor-pointer flex flex-col">
            //       <CardHeader>
            //         <div className="flex items-center gap-4">
            //           <div className={colorClass}>{feature.icon}</div>
            //           <CardTitle className="text-xl">
            //             {translated.title}
            //           </CardTitle>
            //         </div>
            //       </CardHeader>
            //       <CardContent className="flex-grow">
            //         <p className="text-muted-foreground">
            //           {translated.description}
            //         </p>
            //       </CardContent>
            //     </Card>
            //   </DialogTrigger>
            //   <DialogContent className="sm:max-w-[600px]">
            //     <DialogHeader>
            //       <div className="flex items-center gap-4 mb-4">
            //         <div
            //           className={`inline-block p-3 bg-accent/10 rounded-lg ${colorClass}`}
            //         >
            //           {feature.icon}
            //         </div>
            //         <DialogTitle className="text-2xl">
            //           {translated.title}
            //         </DialogTitle>
            //       </div>
            //     </DialogHeader>
            //     <div className="space-y-6">
            //       <p className="text-muted-foreground">
            //         {translated.longDescription}
            //       </p>
            //       <div className="rounded-xl border-2 shadow-lg overflow-hidden">
            //         <Image
            //           src={feature.screenshot}
            //           alt={`${translated.title} Screenshot`}
            //           width={1200}
            //           height={800}
            //           className="w-full"
            //           data-ai-hint={feature.screenshotHint}
            //         />
            //       </div>
            //     </div>
            //   </DialogContent>
            // </Dialog>
          );
        })}
      </div>
    </section>
  );
}
