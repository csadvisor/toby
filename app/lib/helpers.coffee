h = {}

String::capitalize = ->
  @[0].toUpperCase() + @[1...@.length]

String::unCamel = ->
  camel = @replace(/(^[A-Z])/, (v) -> v.toLowerCase())
  regex = /([A-Z])/
  while camel.match regex
    camel = camel.replace(regex, (v) -> "_#{v.toLowerCase()}")
  return camel

String::removeFirst = (delimiter) ->
  split = @split(delimiter)
  first = split.shift()
  rest = split.join(delimiter)
  {first, rest}

String::parseName = ->
  {first, rest} = @unCamel().removeFirst('_')
  role: first, fileName: rest

module.exports = h
