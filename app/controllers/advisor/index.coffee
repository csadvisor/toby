Petition = require('models/petition')

GerhartRoute = require('controllers/gerhart_route')
PetitionList = require('controllers/petition_list')

class AdvisorIndex extends GerhartRoute
  @configure 'AdvisorIndex'

  elements:
    '.root': 'root'

  constructor: ->
    super
    @state = 'pending'

  render: ->
    super
    el = @root
    states = ['all'].concat Petition.states
    columns = ['view']
    state = 'pending'
    @add @list = new PetitionList({el: @root, @state, columns, state, states})
    @list.render()

  filter: (e) ->
    e.preventDefault()
    @list.state = $(e.target).attr('value')
    @list.state = null if @list.state is 'all'
    @list.render()

module.exports = AdvisorIndex
