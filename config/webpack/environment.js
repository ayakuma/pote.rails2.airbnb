const { environment } = require('@rails/webpacker')


// Vue.js フル版（Compiler入り）
environment.config.resolve.alias = { 'vue$': 'vue/dist/vue.esm.js' }

// jQueryとBootstapのJSを使えるように
const webpack = require('webpack')
environment.plugins.prepend(
  'Provide',
  new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery',
    Popper: 'popper.js'
  })
)

module.exports = environment