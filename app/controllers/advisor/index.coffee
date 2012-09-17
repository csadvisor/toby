GerhartRoute = require('controllers/gerhart_route')
PetitionList = require('controllers/petition_list')

class AdvisorIndex extends GerhartRoute
  @configure 'AdvisorIndex'

  elements:
    '.root': 'root'

  events:
    'click .filters a': 'filter'

  constructor: ->
    super
    @state = 'pending'

  render: ->
    super
    @add @list = new PetitionList({el: @root, @state, columns: ['view']})
    @list.render()

  filter: (e) ->
    e.preventDefault()
    @list.state = $(e.target).attr('value')
    @list.state = null if @list.state is 'all'
    @list.render()

module.exports = AdvisorIndex
