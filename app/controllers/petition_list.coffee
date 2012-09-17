Petition = require('models/petition')

d = debug('controllers/petition_list')

class PetitionList extends Spine.Controller
  constructor: ->
    super
    Petition.bind('create update', @render)
    @render()

  render: =>
    petitions = @getPetitions()
    d 'render', petitions
    @html require('views/petition_list')({petitions})

  getPetitions: ->
    if @status
      Petition.findAllByAttribute('status', @status)
    else
      Petition.all()
    
module.exports = PetitionList
