class AdviseePetition extends Spine.Controller
  constructor: () ->
    super
    @render()

  render: () ->
    @html require('views/petition')(@petition)

    
module.exports = AdviseePetition
