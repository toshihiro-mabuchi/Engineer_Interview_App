// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
// Rails6でjqueryを使える様にするため追加
import "jquery"
// import 'stylesheets/application';
// import 'javascripts/application';
// require.context('../images', true, /\.(png|jpg|jpeg|svg)$/);

Rails.start()
Turbolinks.start()
ActiveStorage.start()
// window.jQuery = window.$ = require('jquery')
// require("@rails/ujs").start()
// require("turbolinks").start()
// require("@rails/activestorage").start()
// require("channels")
// // 追記
// require('jquery')