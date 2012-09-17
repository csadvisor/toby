PetitionForm = require('controllers/petition_form')

class AdviseePetitionEdit extends Spine.Controller
  elements:
    '.root': 'root'

  constructor: ->
    super
    @render()

  render: ->
    @html require('views/advisee/petition_edit')
    @petition.one('change', @update)
    new PetitionForm({el: @root, @petition})

  update: =>
    console.error 'update'
    @navigate(@petition.url())

module.exports = AdviseePetitionEdit
