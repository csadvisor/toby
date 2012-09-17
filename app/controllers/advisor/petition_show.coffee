PetitionShow = require('controllers/petition_show')
GerhartRoute = require('controllers/gerhart_route')

class AdvisorPetitionShow extends GerhartRoute
  @configure 'AdvisorPetitionShow'

  elements:
    '.root': 'root'

  render: ->
    super(@petition)
    show = new PetitionShow({el: @root, @petition})
    show.render()

module.exports = AdvisorPetitionShow
