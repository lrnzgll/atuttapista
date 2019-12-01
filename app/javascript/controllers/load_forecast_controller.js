import { Controller } from "stimulus"
import consumer from '../channels/consumer'

export default class extends Controller {
  static targets = [ "tags" ]

  connect() {
    let thisController = this;
    consumer.subscriptions.create( { channel: 'WeatherForecastChannel', request_id: this.data.get('request'), ip: this.data.get('ip')}, {
      received({weather}) {
        thisController.tagsTarget.innerHTML = weather;
      }
    });
  }
}
