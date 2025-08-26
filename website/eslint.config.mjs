import docusaurusPlugin from "@docusaurus/eslint-plugin";

export default [
  {
    files: ["**/*.js", "**/*.jsx", "**/*.ts", "**/*.tsx"],
    plugins: {
      docusaurus: docusaurusPlugin,
    },
    extends: ["plugin:docusaurus/recommended"],
  },
];
