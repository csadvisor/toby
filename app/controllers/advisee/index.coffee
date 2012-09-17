PetitionForm = require('controllers/petition_form')
PetitionList = require('controllers/petition_list')
GerhartRoute = require('controllers/gerhart_route')

class AdviseeIndex extends GerhartRoute
  @configure 'AdviseeIndex'

  elements:
    '.create': 'elCreate'
    '.sidebar': 'elSidebar'

  render: () ->
    super

    @add create = new PetitionForm(el: @elCreate, petition: new Petition())
    @add sidebar = new PetitionList(el: @elSidebar)
    create.render()
    sidebar.render()

module.exports = AdviseeIndex