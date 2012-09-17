PetitionForm = require('controllers/petition_form')
GehartRoute = require('controllers/gerhart_route')

class AdviseePetitionEdit extends GehartRoute
  @configure 'AdviseePetitionEdit'

  elements:
    '.root': 'root'

  bind: ->
    @petition.one('change', @update)

  render: ->
    super
    @add form = new PetitionForm({el: @root, @petition})
    form.render()

  update: =>
    console.error 'update'
    @navigate(@petition.url())

module.exports = AdviseePetitionEdit
