PetitionShow = require('controllers/petition_show')
GerhartRoute = require('controllers/gerhart_route')

class AdminPetitionShow extends GerhartRoute
  @configure 'AdminPetitionShow'

  elements:
    '.root': 'root'

  render: ->
    super(@petition)
    show = new PetitionShow({el: @root, @petition})
    show.render()

module.exports = AdminPetitionShow
