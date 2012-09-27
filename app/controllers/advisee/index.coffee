Petition = require('models/petition')

UserCtx = require('singletons/user_ctx')

PetitionForm = require('controllers/petition_form')
PetitionList = require('controllers/petition_list')
GerhartRoute = require('controllers/gerhart_route')

class AdviseeIndex extends GerhartRoute
  @configure 'AdviseeIndex'

  elements:
    '.transcript': 'elTranscript'
    '.create': 'elCreate'
    '.sidebar': 'elSidebar'

  render: () ->
    super

    el = @elSidebar
    states = Petition.states.concat ['all']
    columns = ['edit', 'view', 'delete']
    defaultState = 'approved'
    state = 'all'
    @add sidebar = new PetitionList({el, columns, states, columns, state})

    if UserCtx.get().transcript
      @elTranscript.html require('views/advisee/transcript_form')(transcript: true)
      @add create = new PetitionForm(el: @elCreate, petition: new Petition())
      create.render()
    else
      @elTranscript.html require('views/advisee/transcript_form')(transcript: false)

    sidebar.render()

module.exports = AdviseeIndex
