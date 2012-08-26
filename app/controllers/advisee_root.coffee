Create = require('controllers/create')
Sidebar = require('controllers/sidebar')

d = debug('controllers/advisee_root')

class AdviseeRoot extends Spine.Controller
  elements:
    '.create': 'elCreate'
    '.sidebar': 'elSidebar'

  constructor: () ->
    super
    @render()

  render: () ->
    d 'render'
    @html require('views/layouts/advisee_root')

    @controllerCreate = new Create(el: @elCreate, petition: new Petition())
    @controllerSidebar = new Sidebar(el: @elSidebar)

module.exports = AdviseeRoot
