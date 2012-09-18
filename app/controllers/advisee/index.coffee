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

    el = @elSidebar
    states = Petition.states.concat ['all']
    columns = ['edit', 'view', 'delete']
    defaultState = 'approved'
    state = 'all'
    @add sidebar = new PetitionList({el, columns, states, columns, state})

    @add create = new PetitionForm(el: @elCreate, petition: new Petition())
    create.render()
    sidebar.render()

module.exports = AdviseeIndex
