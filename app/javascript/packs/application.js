import "bootstrap";
import '../stylesheets/application';
import 'mapbox-gl/dist/mapbox-gl.css';

require.context('../stylesheets/images', true, /\.(?:png|jpg|gif|ico|svg)$/)
var Turbolinks = require("turbolinks")
Turbolinks.start()
const Rails = require('rails-ujs');
Rails.start();
