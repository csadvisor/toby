d = debug('controllers/create')

class Create extends Spine.Controller
  events:
    'submit form.petition': 'create'

  render: () ->
    @html require('views/form')(@petition)

  constructor: () ->
    super
    @render()

  create: (e) ->
    e.preventDefault()
    @petition.fromForm(e.target)
    @petition.save()
    unless errors
      d 'Error create petition', errors
    else
      # show success message
      d 'Petition created sucessfully', @petition
      @petition = null
      @render()

    
module.exports = Create
