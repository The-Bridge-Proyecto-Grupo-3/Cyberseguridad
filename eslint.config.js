// eslint.config.js
import js from "@eslint/js";
import pluginSecurity from "eslint-plugin-security";
import pluginNode from "eslint-plugin-node";
import pluginPromise from "eslint-plugin-promise";

export default [
  js.configs.recommended,
  {
    plugins: {
      security: pluginSecurity,
      node: pluginNode,
      promise: pluginPromise,
    },
    rules: {
      // 🔐 Seguridad
      "no-eval": "error",
      "no-new-func": "error",
      "security/detect-object-injection": "warn",
      "security/detect-non-literal-fs-filename": "warn",

      // ⚙️ Buenas prácticas
      "no-console": ["warn", { allow: ["warn", "error"] }],
      eqeqeq: "error",
      "prefer-const": "warn",
      "no-shadow": "error",
      "no-unused-vars": ["warn", { argsIgnorePattern: "^_" }],
    },
  },
];
