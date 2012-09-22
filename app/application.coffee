Spine.Model.host = 'index.php/app'

Fetcher = require('singletons/fetcher')
UserCtx = require('singletons/user_ctx')

Advisee = require('controllers/advisee/router')
Admin   = require('controllers/admin/router')
Advisor = require('controllers/advisor/router')
Header  = require('controllers/header')
NonRoll = require('controllers/non_roll')

d = debug('app')


class App extends Spine.Controller
  elements:
    '.header': 'header'
    '.root': 'root'

  render: ->
    @html require('views/application/index')

  constructor: () ->
    super
    @render()

    Fetcher.one('refresh', @refresh)
    Fetcher.fetchAll()

  refresh: =>
    d 'UserCtx.role', UserCtx.role
    switch UserCtx.role()
      when 'admin' then controller = new Admin(el: @root)
      when 'advisor' then controller = new Advisor(el: @root)
      when 'advisee' then controller = new Advisee(el: @root)
      else controller = new NonRoll(el: @root)
    controller.render()

    header = new Header(el: @header)
    header.render()


    Spine.Route.setup()
    startRoute = if window.location.hash is '' then '/' else window.location.hash
    d 'startRoute', startRoute
    Spine.Route.navigate(startRoute)


module.exports = App
