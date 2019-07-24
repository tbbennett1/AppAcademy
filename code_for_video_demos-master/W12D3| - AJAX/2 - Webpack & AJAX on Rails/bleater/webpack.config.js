const path = require("path");

module.exports = {
  mode: "development",
  context: __dirname,
  entry: "./frontend/entry.js",
  output: {
    path: path.resolve(__dirname, "app", "assets", "javascripts"),
    filename: "bundle.js",
    devtoolModuleFilenameTemplate: "[resourcePath]",
    devtoolFallbackModuleFilenameTemplate: "[resourcePath]?[hash]",
  },
  devtool: "source-map",
};