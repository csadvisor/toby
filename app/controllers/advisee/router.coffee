Petition = require('models/petition')

AdviseeRoot = require('controllers/advisee/index')
AdviseePetitionShow = require('controllers/advisee/petition_show')
AdviseePetitionEdit = require('controllers/advisee/petition_edit')

d = debug('controllers/advisee')

class Advisee extends Spine.Controller
  elements: '.root': 'root'

  render: ->
    @html require('views/layouts/advisee')

  constructor: ->
    super
    @render()
    @routes(@_routes)

  _routes:

    '/': () ->
      new AdviseeRoot(el: @root)

    '/petitions/:id': (params) ->
      new AdviseePetitionShow(el: @root, petition: Petition.find(params.id))

    '/petitions/:id/edit': (params) ->
      new AdviseePetitionEdit(el: @root, petition: Petition.find(params.id))

    '/petitions/:id/delete': (params) ->
      Petition.find(params.id).destroy()
      @navigate('/')

module.exports = Advisee
