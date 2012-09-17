GehartRoute = require('controllers/gerhart_route')

class PetitionForm extends GehartRoute
  @configure 'PetitionForm'

  events:
    'submit form.petition': 'create'

  # @override
  render: () ->
    @html require('views/petition_form')(@petition)

  create: (e) ->
    e.preventDefault()
    @petition.fromForm(e.target)
    @petition.bind 'error', (errors) ->
      @d 'Error create petition', errors
    @petition.bind 'success', () ->
      # show success message
      @d 'Petition created sucessfully', @petition
      @petition = null
      @render()

    @petition.save()

    
module.exports = PetitionForm
