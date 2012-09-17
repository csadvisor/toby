PetitionShow = require('controllers/petition_show')

class AdviseePetitionShow extends Spine.Controller
  elements:
    '.root': 'root'

  constructor: ->
    super
    @show = new PetitionShow({el: @root, @petition})

  render: ->
    @html require('views/advisee/petition_show')
    @show.render()

module.exports = AdviseePetitionShow
