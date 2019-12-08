const { environment } = require('@rails/webpacker')

const webpack = require('webpack')
const merge = require("webpack-merge")
const parts = require("./fast-css")


// Preventing Babel from transpiling NodeModules packages
environment.loaders.delete('nodeModules');

// Bootstrap 4 has a dependency over jQuery & Popper.js:
environment.plugins.prepend('Provide',
  new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery',
    Popper: ['popper.js', 'default']
  })
)

enviroment = merge([
  parts.loadCSS(),
]);

module.exports = environment
