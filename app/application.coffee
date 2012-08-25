Petition = require('models/petition')

Create = require('controllers/create')
Edit = require('controllers/edit')
Review = require('controllers/review')
Sidebar = require('controllers/sidebar')
ViewPetition = require('controllers/view-petition')

class App extends Spine.Controller
  constructor: () ->
    super

    Petition.fetch()

    # define routes
    @routes

      '/admin': (params) ->
        @html require('views/admin/root-wrap')()
        new Review(el: $('#review'))

      '/advisee': () ->

        # render template
        @html require('views/advisee/root-wrap')()

        # add create controller
        new Create(petition: new Petition(), el: $('#create'))

        # add list controller
        #new List(where: user: '<current user>', el: $('#list'))
        new Sidebar(el: $('#sidebar'))


      '/advisee/petitions/:id': (params) ->
        @html require('views/advisee/view-wrap')
        new ViewPetition(el: $('#petition'), id: params.id)


      '/advisee/petitions/:id/edit': (params) ->
        @html require('views/advisee/edit-wrap')()
        new Edit(petition: Petition.find(params.id), el: $('#edit'))

    Spine.Route.setup()
    #Spine.Route.setup(history: true)


module.exports = App
