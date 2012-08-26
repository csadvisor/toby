Petition = require('models/petition')

AdviseeRoot = require('controllers/advisee_root')
AdviseePetition = require('controllers/advisee_petition')

d = debug('controllers/advisee')

class Advisee extends Spine.Controller
  elements: '.root': 'root'
  render: () -> @html require('views/layouts/advisee')

  constructor: () ->
    super
    @render()
    @routes(@_routes)

  _routes:

    '/': () ->
      new AdviseeRoot(el: @root)

    '/petitions/:id': (params) ->
      new AdviseePetition(el: @root, petition: Petition.find(params.id))

    '/petitions/:id/edit': (params) ->
      new AdviseePetitionEdit(el: @root, petition: Petition.find(params.id))

module.exports = Advisee
