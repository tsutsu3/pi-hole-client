import nextra from "nextra";

const repo = "pi-hole-client";
const isProd = process.env.NODE_ENV === "production";
const enableBasePath = isProd || process.env.ENABLE_BASE_PATH === "true";

console.log("Subpath:", enableBasePath ? `/${repo}` : "");

const nextConfig = {
  output: "export",
  images: {
    unoptimized: true, // mandatory, otherwise won't export
  },
  trailingSlash: true,
  basePath: enableBasePath ? `/${repo}` : "",
};

const withNextra = nextra({
  defaultShowCopyCode: true,
  search: {
    codeblocks: false,
  },
  contentDirBasePath: "/docs",
});

export default withNextra(nextConfig);
