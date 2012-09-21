class UserCtx extends Spine.Model
  @extend Spine.Model.Ajax

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
    #@role = 'advisee'
    #@role = 'admin'
    @role = 'advisor'
    @trigger('refresh')

# singleton export
userCtx = new UserCtx
module.exports = userCtx
