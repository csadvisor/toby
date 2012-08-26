PetitionForm = require('controllers/petition_form')

class AdviseePetitionEdit extends Spine.Controller
  constructor: () ->
    super
    @render()

  render: () ->
    @html require('views/layouts/advisee_petition_edit')
    new PetitionForm({el: @root, @petition})
