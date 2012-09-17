Petition = require('models/petition')
GerhartRoute = require('controllers/gerhart_route')

class PetitionList extends GerhartRoute
  @configure 'PetitionList'

  events = 'create update'

  bind: ->
    Petition.bind(events, @render)

  # @override
  render: =>
    petitions = @getPetitions()
    @debug 'render', petitions
    @html require('views/petition_list')({petitions, @columns})

  getPetitions: ->
    if @state
      Petition.findAllByAttribute('state', @state)
    else
      Petition.all()

  release: ->
    super
    Petition.unbind(events, @render)
    
module.exports = PetitionList
