UserCtx = require('singletons/user_ctx')

class Petition extends Spine.Model
  fields = [
    'id'
    'student_id'
    'advisor_id'
    'state'
    'stanford_description'
    'stanford_syllabus'
    'stanford_textbooks'
    'transfer_description'
    'transfer_syllabus'
    'transfer_textbooks'
    'course_number'
    'created_on'
    'last_modified'
    'transcript'
  ]
  @configure 'Petition', fields...
  @extend Spine.Model.Ajax

  @hurl: (args...) ->
    if args.length > 0
      "#/petitions/#{args.join('/')}"
    else
      "#/petitions"

  hurl: (args...) ->
    @constructor.hurl(@id ? @cid, args...)

  assignDefaults: ->
    @state = 'pending'
    @student_id = UserCtx.get().id # only students and create petitions
    @advisor_id = UserCtx.get().advisor_id

  create: ->
    @assignDefaults()
    super

  getClass: ->
    switch @state
      when 'pending' then 'info'
      when 'approved', 'processed' then 'success'
      when 'rejected' then 'error'

  @states: [
    'approved'
    'rejected'
    'pending'
    'processed'
  ]

module.exports = Petition
