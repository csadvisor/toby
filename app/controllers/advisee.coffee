Create = require('controllers/create')
Sidebar = require('controllers/sidebar')

d = debug('controllers/advisee')

class Advisee extends Spine.Controller
  constructor: () ->
    super
    @routes(@_routes)

  _routes:
    '/': () ->
      # render template
      @html require('views/advisee/root-wrap')()

      # add create controller
      new Create(petition: new Petition(), el: $('#create'))

      # add list controller
      #new List(where: user: '<current user>', el: $('#list'))
      new Sidebar(el: $('#sidebar'))

    '/petitions/:id': (params) ->
      @html require('views/advisee/view-wrap')
      new ViewPetition(el: $('#petition'), id: params.id)

    '/petitions/:id/edit': (params) ->
      @html require('views/advisee/edit-wrap')()
      new Edit(petition: Petition.find(params.id), el: $('#edit'))

module.exports = Advisee
