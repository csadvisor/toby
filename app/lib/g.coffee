require('lib/helpers')

module.exports = (module) ->
  if window?
    window[module] ? window[module.capitalize()]
  else
    require(module)
