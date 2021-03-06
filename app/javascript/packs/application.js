// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start();
require("@rails/activestorage").start();
require("trix");
require("@rails/actiontext");
require('close_button.js');
require('display_content-tags.js');
require('direct_uploads.js');

// CSS
import '../stylesheets/application.css.scss';
import '../stylesheets/trix.css.scss';
import '../stylesheets/direct_uploads.css';

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
require.context('../images', true);
