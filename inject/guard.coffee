# (cbname) ->
unless typeof cbname == 'function' or typeof cbname == 'undefined'
  throw new Error "Coffeescript Guard: Supplied value for argument cbname is not a function: #{require('util').inspect cbname}"
if typeof cbname == 'function'
  cbname = do (cbname, c=false) -> () ->
    throw new Error "Coffeescript Guard: Called callback (cbname) twice" if c
    c = true
    cbname.apply this, arguments
