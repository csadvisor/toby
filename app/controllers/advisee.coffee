AdviseeRoot = require('controllers/advisee_root')

d = debug('controllers/advisee')

class Advisee extends Spine.Controller
  elements: '.root': 'root'
  render: () -> @html require('views/layouts/advisee')

  constructor: () ->
    super
    @render()
    @routes(@_routes)

  _routes:
    '/': () -> new AdviseeRoot(el: @root)
    '/petitions/:id': (params) ->
      @html require('views/advisee/view-wrap')
      new ViewPetition(el: $('#petition'), id: params.id)

    '/petitions/:id/edit': (params) ->
      @html require('views/advisee/edit-wrap')()
      new Edit(petition: Petition.find(params.id), el: $('#edit'))

module.exports = Advisee
