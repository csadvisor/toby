Petition = require('models/petition')
GerhartRoute = require('controllers/gerhart_route')
d = debug('controllers/petitions_list')

class PetitionList extends GerhartRoute
  @configure 'PetitionList'

  events:
    'click .filters a': 'filter'

  filter: (e) =>
    e.preventDefault()
    @state = @$(e.target).attr('value')
    d 'filter clicked', @state
    @render()

  events = 'create update'

  bind: ->
    Petition.bind(events, @render)

  # @override
  render: =>
    petitions = @getPetitions()
    @debug 'render', petitions
    @html require('views/petition_list')({petitions, @columns, @state, @defaultState, @states})

  getPetitions: =>
    if @state is 'all'
      Petition.all()
    else
      Petition.findAllByAttribute('state', @state)

  release: ->
    super
    Petition.unbind(events, @render)
    
module.exports = PetitionList
