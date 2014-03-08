PetitionShow = require('controllers/petition_show')
GerhartRoute = require('controllers/gerhart_route')

class AdvisorPetitionShow extends GerhartRoute
  @configure 'AdvisorPetitionShow'

  elements:
    '.root': 'root'
    '.reason': 'reason'

  events:
  	'click input.approve': 'approvePetition'
  	'click input.reject': 'rejectPetition'

  render: ->
    super(@petition)
    show = new PetitionShow({el: @root, @petition})
    show.render()

  approvePetition: (e) ->
  	@petition.reason = @reason[0].value
  	@petition.save()
  	@navigate(@petition.hurl('approve'))

  rejectPetition: (e) ->
  	@petition.reason = @reason[0].value
  	@petition.save()
  	@navigate(@petition.hurl('reject'))

module.exports = AdvisorPetitionShow
