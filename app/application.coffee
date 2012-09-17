Fetcher = require('singletons/fetcher')
UserCtx = require('singletons/user_ctx')

Advisee = require('controllers/advisee/router')
#Admin   = require('controllers/admin/router')
#Advisor = require('controllers/advisor/router')

d = debug('app')


class App extends Spine.Controller
  elements:
    '.root': 'root'

  render: ->
    @html require('views/application/index')

  constructor: () ->
    super
    @render()

    Fetcher.one('refresh', @refresh)
    Fetcher.fetchAll()

  refresh: () =>
    switch UserCtx.role
      #when 'admin'
      #when 'advisor'
      when 'advisee'
        new Advisee(el: @root)

    Spine.Route.setup()
    Spine.Route.navigate(window.location.hash ? '#/')


module.exports = App
