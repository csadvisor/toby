UserCtx = require('models/user_ctx')

class UserCtxSingleton

  # these will not before Models have all been fetched
  get: () ->
    UserCtx.first()

  role: () ->
    UserCtx.first().role

# singleton instantiation
userCtxSingleton = new UserCtxSingleton
module.exports = userCtxSingleton
