class UserCtx extends Spine.Model
  fields = [
    'user_id'
    'role'
  ]
  @controllers 'UserCtx', fields...

  fetch: () ->
    @role = 'admin'
    @trigger 'refresh'

userCtx = new UserCtx
module.exports = userCtx
