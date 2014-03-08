UserCtx = require('singletons/user_ctx')

LINK_EXP = new RegExp('((https?://)?(([0-9a-z_!~*\'().&=+$%-]+: )?[0-9a-z_!~*\'().&=+$%-]+@)?(([0-9]{1,3}\.){3}[0-9]{1,3}|([0-9a-z_!~*\'()-]+\.)*([0-9a-z][0-9a-z-]{0,61})?[0-9a-z]\.[a-z]{2,6})(:[0-9]{1,4})?((/?)|(/[0-9a-z_!~*\'().;?:@&=+$,%#-]+)+/?))', 'gi')
# this breaks for hashes at end sometimes

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
    'reason'

    's_first'
    's_last'
    's_alias'
    's_school'

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
    return unless @s_first? and @s_last
    "#{@s_first} #{@s_last}"

  advisorName: ->
    return unless @a_first? and @a_last
    "#{@a_first} #{@a_last}"

  courseNumber: ->
    @course_number.toUpperCase()

  syllabus: (school) ->
    # TODO: figure security problem here
    # @["#{school}_syllabus"].replace(LINK_EXP, '<a href="$1">$1</a>')
    @["#{school}_syllabus"]

  @states: [
    'approved'
    'rejected'
    'pending'
    'processed'
  ]

  @allSorted: (field = 's_last') ->
    Petition.all().sort (a, b) ->
      return -1 if a.s_last?[0] < b.s_last?[0]
      return  1 if a.s_last?[0] > b.s_last?[0]
      return 0


  @findAllByAttributeSorted: (key, value, field = 's_last') ->
    petitions = Petition.allSorted()
    result = []
    for pet in petitions
      result.push(pet) if pet?[key] is value
    result

  # HACK
  dateApproved: ->
    @created_on or '0000-00-00'

  # additional petition fields should not be visible to admin
  visible: ->
    UserCtx.get().role isnt 'admin'

module.exports = Petition
