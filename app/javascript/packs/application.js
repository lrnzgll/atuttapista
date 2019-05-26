var Turbolinks = require("turbolinks")
Turbolinks.start()

import "bootstrap";
import '../stylesheets/application'
require.context('../stylesheets/images', true, /\.(?:png|jpg|gif|ico|svg)$/)
