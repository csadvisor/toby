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

    's_first'
    's_last'
    's_alias'

    'a_first'
    'a_last'
    'a_alias'
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

  studentEmail: ->
    "#{@s_alias}@cs.stanford.edu"

  advisorEmail: ->
    "#{@a_alias}@cs.stanford.edu"

  studentName: ->
    "#{@s_first} #{@s_last}"

  advisorName: ->
    "#{@a_first} #{@a_last}"

  courseNumber: ->
    @course_number.toUpperCase()

  @states: [
    'approved'
    'rejected'
    'pending'
    'processed'
  ]

  @allSorted: (field = 's_last') ->
    Petition.all().sort (a, b) ->
      return -1 if a.s_last[0] < b.s_last[0]
      return  1 if a.s_last[0] > b.s_last[0]
      return 0


  @findAllByAttributeSorted: (key, value, field = 's_last') ->
    petitions = Petition.allSorted()
    result = []
    for pet in petitions
      result.push(pet) if pet?[key] is value
    result

module.exports = Petition
