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

    'nam_friendly'
    'nam_last'
    'email_acct'
    'primary_csalias'
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

    @nam_friendly = UserCtx.get().first_name
    @nam_last = UserCtx.get().last_name
    @primary_csalias = UserCtx.get().csid

  create: ->
    @assignDefaults()
    super

  getClass: ->
    switch @state
      when 'pending' then 'info'
      when 'approved', 'processed' then 'success'
      when 'rejected' then 'error'

  email: ->
    "#{@primary_csalias}@cs.stanford.edu"

  studentName: ->
    "#{@nam_friendly} #{@nam_last}"

  @states: [
    'approved'
    'rejected'
    'pending'
    'processed'
  ]

module.exports = Petition
