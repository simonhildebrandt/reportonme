//= require jasmine-fixture


describe 'TrackerSuite', ->
  beforeEach ->
    affix '#trackers'

  it "to be instantiable", ->
  suite = React.createElement(window.trackerSuite)
  console.log suite
  console.log 'xxx'
