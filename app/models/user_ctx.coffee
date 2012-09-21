class UserCtx extends Spine.Model
  fields = [
    'id'
    'role'
    'first_name'
    'last_name'
  ]
  @configure 'UserCtx', fields...
  @extend Spine.Model.Ajax
  @url: () -> "#{Spine.Model.host}/user_ctx"

module.exports = UserCtx
