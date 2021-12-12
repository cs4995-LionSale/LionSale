// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//= require popper

import Rails from "@rails/ujs"
// import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "jquery"
import flatpickr from 'flatpickr'
import * as Routes from 'routes';
Rails.start()
// Turbolinks.start()
ActiveStorage.start()
window.Routes = Routes;
document.addEventListener('turbolinks:load', () => {
    flatpickr("[data-behavior='flatpickr']", {
      altInput: true,
      altFormat: "F j, Y H:i",
      enableTime: true,
      dateFormat: "Y-m-d H:i",
    });
  })
window.Routes = Routes;
