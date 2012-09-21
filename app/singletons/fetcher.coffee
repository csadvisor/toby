UserCtx = require('models/user_ctx')
Petition = require('models/petition')

# for testing
window.UserCtx = UserCtx
window.Petition = Petition

d = debug('singletons/fetcher')

toLoad = [
  UserCtx
  Petition
]

class Fetcher extends Spine.Model

  fetchAll: () ->
    d 'fetchAll'

    counter = 0

    fetchAndListen = (module) =>
      module.one 'refresh', () =>
        d "Fetched #{module.constructor.name}"
        if ++counter is toLoad.length
          d 'event:refresh'
          @trigger('refresh')
      module.fetch()

    fetchAndListen(module) for module in toLoad


# singleton export
fetcher = new Fetcher
module.exports = fetcher
