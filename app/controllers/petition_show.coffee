GehartRoute = require('controllers/gerhart_route')

class AdviseePetition extends GehartRoute
  @configure 'AdviseePetition'

  constructor: () ->
    super
    @render()

  render: () ->
    @html require('views/advisee/petition_show')(@petition)

    
module.exports = AdviseePetition
