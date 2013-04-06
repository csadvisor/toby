PetitionForm = require('controllers/petition_form')
GerhartRoute = require('controllers/gerhart_route')

class AdviseePetitionEdit extends GerhartRoute
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
    console.log 'update'
    @navigate(@petition.hurl())

module.exports = AdviseePetitionEdit
