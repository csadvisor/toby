Petition = require('models/petition')

AdviseeRoot = require('controllers/advisee/index')
AdviseePetitionShow = require('controllers/advisee/petition_show')
AdviseePetitionEdit = require('controllers/advisee/petition_edit')
GehartRoute = require('controllers/gerhart_route')

d = debug('controllers/advisee')

class AdviseeRouter extends GehartRoute
  @configure 'AdviseeRouter'

  elements: '.root': 'root'

  constructor: ->
    super
    @routes(@_routes)

  _routes:

    '/': () ->
      @add controller = new AdviseeRoot(el: @root)
      controller.render()

    '/petitions/:id': (params) ->
      @add controller = new AdviseePetitionShow(el: @root, petition: Petition.find(params.id))
      controller.render()

    '/petitions/:id/edit': (params) ->
      @add controller = new AdviseePetitionEdit(el: @root, petition: Petition.find(params.id))
      controller.render()

    '/petitions/:id/delete': (params) ->
      Petition.find(params.id).destroy()
      @navigate('/')

module.exports = AdviseeRouter
