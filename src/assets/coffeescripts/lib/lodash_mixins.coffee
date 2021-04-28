capitalize = (string) ->
  string.charAt(0).toUpperCase() + string.slice(1).toLowerCase()

_({ 'capitalize': capitalize }).mixin({ 'chain': false })
