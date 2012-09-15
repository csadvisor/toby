Fetcher = require('singletons/fetcher')
UserCtx = require('singletons/user_ctx')

Advisee = require('controllers/advisee/router')
#Admin   = require('controllers/admin/router')
#Advisor = require('controllers/advisor/router')

d = debug('app')


class App extends Spine.Controller
  elements:
    '.root': 'root'

  render: () ->
    @html require('views/layouts/app')

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

    # define routes
    #    @routes
    #
    #      '/admin': (params) ->
    #        @html require('views/admin/root-wrap')()
    #        new Review(el: $('#review'))
    #
    #      '/advisee': () ->
    #
    #        # render template
    #        @html require('views/advisee/root-wrap')()
    #
    #        # add create controller
    #        new Create(petition: new Petition(), el: $('#create'))
    #
    #        # add list controller
    #        #new List(where: user: '<current user>', el: $('#list'))
    #        new Sidebar(el: $('#sidebar'))
    #
    #
    #      '/advisee/petitions/:id': (params) ->
    #        @html require('views/advisee/view-wrap')
    #        new ViewPetition(el: $('#petition'), id: params.id)
    #
    #
    #      '/advisee/petitions/:id/edit': (params) ->
    #        @html require('views/advisee/edit-wrap')()
    #        new Edit(petition: Petition.find(params.id), el: $('#edit'))

    #Spine.Route.setup(history: true)


module.exports = App
