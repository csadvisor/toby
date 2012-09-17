class AdviseePetition extends Spine.Controller
  constructor: () ->
    super
    @render()

  render: () ->
    @html require('views/petition_show')(@petition)

    
module.exports = AdviseePetition
