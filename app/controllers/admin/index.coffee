Petition = require('models/petition')

GerhartRoute = require('controllers/gerhart_route')
PetitionList = require('controllers/petition_list')

class AdminIndex extends GerhartRoute
  @configure 'AdminIndex'

  elements:
    '.root': 'root'

  constructor: ->
    super
    @state = 'approved'

  render: ->
    super
    el = @root
    states = ['all'].concat Petition.states
    columns = ['view']
    defaultState = 'approved'
    @add @list = new PetitionList({el, @state, states, defaultState, columns})
    @list.render()

module.exports = AdminIndex
