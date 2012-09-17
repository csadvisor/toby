Petition = require('models/petition')

AdminRoot = require('controllers/admin/index')
AdminPetitionShow = require('controllers/admin/petition_show')
GerhartRoute = require('controllers/gerhart_route')


class AdminRouter extends GerhartRoute
  @configure 'AdviseeRouter'

  elements: '.root': 'root'

  constructor: ->
    super
    @routes(@_routes)

  _routes:

    '/': () ->
      @add controller = new AdminRoot(el: @root)
      controller.render()

    '/petitions/:id': (params) ->
       @add controller = new AdminPetitionShow(el: @root, petition: Petition.find(params.id))
       controller.render()

    '/petitions/:id/process': (params) ->
      petition = Petition.find(params.id)
      petition.state = 'processed'
      petition.save()
      @navigate('/')


      #'/petitions/:id/delete': (params) ->
      #  Petition.find(params.id).destroy()
      #  @navigate('/')

module.exports = AdminRouter
