import { Controller } from "stimulus";
const algoliasearch = require('algoliasearch');

export default class extends Controller {
  static targets = [ "tags" ]

  connect() {
    console.log('here')
    let thisController = this;
    var client = algoliasearch('2QQ3FJHJ3M', '2849d3d9a9f1444d53a00e16a2bcfa73');
    var index = client.initIndex('Route');
    index.search(this.data.get('query'), { hitsPerPage: 50, page: 0 })
      .then(function searchDone(content) {
      if (content.hits.length > 0) {
        var completepartial = ""
        content.hits.forEach(result =>{
          completepartial += "<div class='route-card'>"+ result.name +"</div> \n"
        })
        thisController.tagsTarget.innerHTML = completepartial;
      } else{
        thisController.tagsTarget.innerHTML = "<div> Nessun itineario trovato </div>"
      }

    }).catch(function searchFailure(err) {
      console.error(err);
    });
  }
}
