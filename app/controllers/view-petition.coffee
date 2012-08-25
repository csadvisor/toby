Spine = require('spine')

Petition = require('models/petition')

class ViewPetition extends Spine.Controller
  constructor: () ->
    super

    Petition.bind 'fetch', () =>
      @petition = Petition.find(@id)
      @render()

    Petition.fetch()

  render: () ->
    @html require('views/petition')(@petition)

    
module.exports = ViewPetition
