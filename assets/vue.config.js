const path = require('path');

module.exports = {
  lintOnSave: process.env.NODE_ENV !== 'production',
  outputDir: '../priv/static',

  chainWebpack: config => {
    config.optimization.delete('splitChunks')
    config
      .output
      .filename('js/[name].js');
    config
      .plugin('extract-css')
      .use(require('mini-css-extract-plugin'), [{
        filename: 'css/[name].css',
      }]);
  },
  css: {
    sourceMap: true,
  }
};
