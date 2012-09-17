Spine = require('lib/g')('spine')

class GerhartRoute extends Spine.Controller
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

  render: (data) ->
    @debug 'rendering'
    @html require("views/#{@constructor.role}/#{@constructor.fileName}")(data)


module.exports = GerhartRoute
