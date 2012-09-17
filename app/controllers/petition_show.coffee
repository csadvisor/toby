GerhartRoute = require('controllers/gerhart_route')

class AdviseePetition extends GerhartRoute
  @configure 'AdviseePetition'

  render: () ->
    @html require('views/petition_show')(@petition)

    
module.exports = AdviseePetition
