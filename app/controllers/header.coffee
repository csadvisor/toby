UserCtx = require('singletons/user_ctx')

class Header extends Spine.Controller

  render: ->
    @html require('views/header/index')({UserCtx})

module.exports = Header
