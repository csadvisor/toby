Spine = require('spine')
List = require('spine/lib/list')

Petition = require('models/petition')
Preview = require('controllers/preview')

class Sidebar extends Spine.Controller

  elements:
    '.items': 'items'

  constructor: () ->
    super

    @html require('views/list')()

    @list = new List
      el: $('.items')
      template: require('views/preview')

#   @list.bind 'change', (petition) =>
#     @navigate petition.url()

    # make sure sidebar stays up to date
    Petition.bind 'create update', () =>
      @render()

    @render()


  render: () ->
    petitions = Petition.all() # @todo select where conditions
    @list.render(petitions)
    
module.exports = Sidebar
