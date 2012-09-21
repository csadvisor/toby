Petition = require('models/petition')

AdvisorRoot = require('controllers/advisor/index')
AdvisorPetitionShow = require('controllers/advisor/petition_show')
GerhartRoute = require('controllers/gerhart_route')

class AdvisorRouter extends GerhartRoute
  @configure 'AdvisorRouter'

  elements: '.root': 'root'

  constructor: ->
    super
    @routes(@_routes)

  _routes:

    '/': () ->
      @add controller = new AdvisorRoot(el: @root)
      controller.render()

    '/petitions/:id': (params) ->
      @add controller = new AdvisorPetitionShow(el: @root, petition: Petition.find(params.id))
      controller.render()

    '/petitions/:id/reject': (params) ->
      petition = Petition.find(params.id)
      petition.state = 'rejected'
      petition.save()
      @navigate('/')

    '/petitions/:id/approve': (params) ->
      petition = Petition.find(params.id)
      petition.state = 'approved'
      petition.save()
      @navigate('/')

module.exports = AdvisorRouter
