import { Application } from "@hotwired/stimulus";
import { definitionsFromContext } from '@hotwired/stimulus-webpack-helpers';


const application = Application.start()
const context = require.context('../controllers', true, /\.js$/)
application.load(definitionsFromContext(context))


// import Flatpickr
import Flatpickr from "stimulus-flatpickr"

application.register('flatpickr', Flatpickr)

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }
