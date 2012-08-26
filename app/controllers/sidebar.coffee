Petition = require('models/petition')

d = debug('controllers/sidebar')

class Sidebar extends Spine.Controller
  constructor: ->
    super
    Petition.bind('create update', @render)
    @render()

  render: =>
    @html require('views/sidebar')(petitions: Petition.all())
    
module.exports = Sidebar
