Spine = require('lib/g')('spine')

class GehartRoute extends Spine.Controller
  @configure: (@name) ->
    {@role, @fileName} = @name.parseRouteName()

  # should be override in inheriting classes
  bind: ->

  constructor: ->
    super
    @bind()
    @controllers = []
    @debug = debug("#{@constructor.role}/#{@constructor.fileName}")

  add: (controller) ->
    @controllers.push(controller)

  render: ->
    @debug 'rendering'
    @html require("views/#{@constructor.role}/#{@constructor.fileName}")


module.exports = GehartRoute
