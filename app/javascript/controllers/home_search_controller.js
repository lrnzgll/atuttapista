import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "body" ]
  search() {

    if (this.bodyTarget.value == '') {
      event.preventDefault()
      document.querySelector('.search-tip').classList.remove('hidden')
    }
  }
}