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
    '.notifyAdvisor': 'notifyButton'
    '.notifyAlert': 'notifyAlert'

  events:
    'click .notifyAdvisor': 'notifyAdvisor'

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

  notifyAdvisor: () =>
    # HACK: should be in controller state - not in DOM
    return if @notifyButton.attr('class').split(' ').indexOf('disabled') isnt -1
    @notifyButton.addClass('disabled')
    fadeIn = => @notifyAlert.fadeIn()
    $.ajax(type: 'post', url: 'app/notify').done(fadeIn)

module.exports = AdviseeIndex
