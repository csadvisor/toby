h = require('lib/helpers')
should = require('should')

describe 'helpers', ->
  describe '#capitalize', ->
    it 'should work', ->
      'toby'.capitalize().should.eql 'Toby'
  describe '#unCamel', ->
    it 'should work', ->
      'AdminControllerHey'.unCamel().should.eql 'admin_controller_hey'
  describe '#parseName', ->
    it 'should work', ->
      {role, fileName} = 'AdminPraticeView'.parseName()
      role.should.eql 'admin'
      fileName.should.eql 'pratice_view'
