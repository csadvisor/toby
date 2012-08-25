Spine = require('spine')

class Preview extends Spine.Controller
  constructor: () ->
    super
    
  render: () ->
    vdata = require('views/preview')(@petition)
    #unless el then return vdata
    #else @html vdata
    return vdata

module.exports = Preview
