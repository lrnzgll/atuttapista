import "controllers"
import 'mapbox-gl/dist/mapbox-gl.css';
import { Application } from "stimulus"
import { definitionsFromContext } from "stimulus/webpack-helpers"

const application = Application.start()
const context = require.context("../controllers", true, /\.js$/)
application.load(definitionsFromContext(context))

var Turbolinks = require("turbolinks")
Turbolinks.start()
const Rails = require('rails-ujs');
Rails.start();
