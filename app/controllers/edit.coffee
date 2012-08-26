class Edit extends Spine.Controller
  constructor: (@petition) ->
    super
    @render()

  render: () ->
    @html require('views/form')(@petition)
    
  events:
    'submit form.petition': 'update'

  validate: () ->
    # @todo clone init petition in construct to validate update
    # @todo validation

  update: (e) ->
    e.preventDefault()
    @petition.fromForm(e.target)
    errors = @petition.save()
    unless errors
      # handle errors
    else
      # show success message
      #@log 'Petition created sucessfully', petition
      @navigate '/'

module.exports = Edit
