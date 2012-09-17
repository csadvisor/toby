GehartRoute = require('controllers/gerhart_route')

class AdviseePetition extends GehartRoute
  @configure 'AdviseePetition'

  render: () ->
    @html require('views/petition_show')(@petition)

    
module.exports = AdviseePetition
