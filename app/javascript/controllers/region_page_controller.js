import { Controller } from "stimulus"
import 'tablesorter';

export default class extends Controller {
  static targets = [ "route" ]
  connect() {
    $(function(){
      $('.region-table-keywords').tablesorter(); 
    });
    $("tr[data-link]").click(function() {
      window.location = $(this).data("link")
    })
  }

}