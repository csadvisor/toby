class Create extends Spine.Controller
  constructor: () ->
    super
    @render()

  render: () ->
    @html require('views/form')(@petition)

  events:
    'submit form.petition': 'create'

  validate: () ->
    # @todo validation

  create: (e) ->
    e.preventDefault()
    petition = Petition.fromForm(e.target)
    errors = petition.save()
    unless errors
      # handle errors
    else
      # show success message
      #@log 'Petition created sucessfully', petition

    
module.exports = Create
