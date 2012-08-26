class UserCtx extends Spine.Model
  fields = [
    'user_id'
    'role'
  ]
  @configure 'UserCtx', fields...

  ###
    @mocked
    @todo implement this for real
  ###
  fetch: () ->
    @role = 'advisee'
    @trigger('refresh')

# singleton export
userCtx = new UserCtx
module.exports = userCtx
