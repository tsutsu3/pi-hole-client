// eslint.config.mjs
import { FlatCompat } from "@eslint/eslintrc";
import eslint from "@eslint/js";
import eslintConfigPrettier from "eslint-config-prettier";
import unusedImports from "eslint-plugin-unused-imports";
import { dirname } from "path";
import tseslint from "typescript-eslint";
import { fileURLToPath } from "url";

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);

const compat = new FlatCompat({ baseDirectory: __dirname });

const tcRules = Object.assign(
  {},
  ...tseslint.configs.recommendedTypeChecked.map((c) => c.rules ?? {}),
  ...tseslint.configs.stylisticTypeChecked.map((c) => c.rules ?? {}),
);

const config = [
  // 0) ignore
  {
    ignores: ["node_modules/**", ".next/**", "out/**", "build/**", "public/**", "next-env.d.ts"],
  },

  // 1) Base: JS Recommended + Next Recommended
  eslint.configs.recommended,
  ...compat.extends("next/core-web-vitals", "next/typescript"),

  // 2) TypeScript
  {
    files: ["**/*.{ts,tsx}"],
    languageOptions: {
      parser: tseslint.parser,
      parserOptions: {
        project: ["./tsconfig.json"],
        tsconfigRootDir: __dirname,
      },
    },
    plugins: {
      "@typescript-eslint": tseslint.plugin,
      "unused-imports": unusedImports,
    },
    rules: {
      ...tcRules,

      "@typescript-eslint/consistent-type-definitions": ["error", "type"],
      "@typescript-eslint/no-unsafe-assignment": "off",
      "@typescript-eslint/no-misused-promises": "off",

      "unused-imports/no-unused-imports": "error",

      ...eslintConfigPrettier.rules,
    },
  },

  // 3) JS/MJS/CJS
  {
    files: ["**/*.{js,jsx,mjs,cjs}"],
    languageOptions: {
      ecmaVersion: "latest",
      sourceType: "module",
    },
    plugins: {
      "unused-imports": unusedImports,
    },
    rules: {
      "unused-imports/no-unused-imports": "warn",
      ...eslintConfigPrettier.rules,
    },
  },
];

export default config;
