Create = require('controllers/create')

class AdviseePetitionEdit extends Spine.Controller
  elements:
    '.root': 'root'

  constructor: ->
    super
    @render()

  render: ->
    @html require('views/layouts/advisee_petition_edit')
    @petition.one('change', @update)
    new Create({el: @root, @petition})

  update: =>
    console.error 'update'
    @navigate(@petition.url())

module.exports = AdviseePetitionEdit
