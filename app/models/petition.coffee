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
    if args.length > 0
      "#/petitions/#{@id ? @cid}/#{args.join('/')}"
    else
      "#/petitions/#{@id ? @cid}"

  assignDefaults: () ->
    @state = 'pending' unless @state

  save: () ->
    @assignDefaults()
    super

  getClass: ->
    switch @state
      when 'pending' then 'info'
      when 'approved', 'processed' then 'success'
      when 'rejected' then 'error'

  #hurl: (args...) ->
  #  "##{@url(args...)}"

  @states: [
    'approved'
    'rejected'
    'pending'
    'processed'
  ]

module.exports = Petition
