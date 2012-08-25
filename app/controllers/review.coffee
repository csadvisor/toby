Spine = require('spine')
List = require('spine/lib/list')

Petition = require('models/petition')

class Review extends Spine.Controller

  events:
    'click .btn': 'filter'

  elements:
    '.filters': 'filters'
    '.items'  : 'items'

  constructor: () ->
    super

    # defaults to just processing approved petitions
    @state = @state ? 'approved'

    @filters.html require('views/admin/filter')()

    @list = new List
      el: $('.items')
      template: require('views/preview')

#   @list.bind 'change', (petition) =>
#     @navigate petition.url()

    # make sure sidebar stays up to date
    Petition.bind 'create update', () =>
      @render()

    @render()

  filter: (e) =>
    @state = e.target.innerHTML.toLowerCase()
    @render()

  render: () ->
    petitions = Petition.findAllByAttribute('state', @state) # @todo select where conditions
    @list.render(petitions)
    
module.exports = Review
