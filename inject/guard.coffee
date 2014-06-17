# (cbname) ->
unless typeof cbname == 'function' or typeof cbname == 'undefined'
  throw new Error "Coffeescript Guard: Supplied value for argument cbname is not a function: #{require('util').inspect cbname}"
if typeof cbname == 'function'
  cbname = do ->
    __cbref = cbname
    __cbcalled = false
    () ->
      if __cbcalled
        throw new Error "Coffeescript Guard: Called callback (cbname) twice"
      __cbcalled = true
      __cbref.apply this, arguments
