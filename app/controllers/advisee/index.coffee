PetitionForm = require('controllers/petition_form')
PetitionList = require('controllers/petition_list')

d = debug('controllers/advisee/index')

class AdviseeRoot extends Spine.Controller
  elements:
    '.create': 'elCreate'
    '.sidebar': 'elSidebar'

  constructor: () ->
    super
    @render()

  render: () ->
    d 'render'
    @html require('views/advisee/index')

    @controllerCreate = new PetitionForm(el: @elCreate, petition: new Petition())
    @controllerSidebar = new PetitionList(el: @elSidebar)

module.exports = AdviseeRoot
