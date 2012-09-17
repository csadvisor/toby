d = debug('controllers/create')

class PetitionForm extends Spine.Controller
  events:
    'submit form.petition': 'create'

  render: () ->
    @html require('views/petition_form')(@petition)

  constructor: () ->
    super
    @render()

  create: (e) ->
    e.preventDefault()
    @petition.fromForm(e.target)
    @petition.bind 'error', (errors) ->
      d 'Error create petition', errors
    @petition.bind 'success', () ->
      # show success message
      d 'Petition created sucessfully', @petition
      @petition = null
      @render()

    @petition.save()

    
module.exports = PetitionForm
