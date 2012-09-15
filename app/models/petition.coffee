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
  @extend Spine.Model.Local
  @extend Spine.Model.Ajax

  constructor: () ->
    super

    # set default values
    @state = 'pending'

  getClass: ->
    switch @state
      when 'pending' then 'info'
      when 'approved', 'processed' then 'success'
      when 'rejected' then 'error'

  hurl: (args...) ->
    "##{@url(args...)}"

module.exports = Petition
