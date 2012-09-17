PetitionShow = require('controllers/petition_show')
GehartRoute = require('controllers/gerhart_route')

class AdviseePetitionShow extends GehartRoute
  @configure 'AdviseePetitionShow'

  elements:
    '.root': 'root'

  render: ->
    super(@petition)
    show = new PetitionShow({el: @root, @petition})
    show.render()

module.exports = AdviseePetitionShow
