//= require jasmine-fixture

React = require 'react'
require 'jasmine-fixture'
jasmineReact = require 'jasmine-react-helpers'


describe 'TrackerSuite', ->
  beforeEach ->
    affix '#trackers'
    @div = $('#trackers').get(0)

  it "to be instantiable", ->
    window.attachTrackerSuite $('#trackers')
    expect($('#trackers div').size()).toEqual(2)

  it "to should load the trackers from the server", ->
    jasmineReact.spyOnClass(window.trackerSuite, "collect").and.returnValue([])
    window.attachTrackerSuite $('#trackers')
    expect(jasmineReact.classPrototype(window.trackerSuite).collect).toHaveBeenCalled()

  it "to should diplay the trackers loaded from the server", ->
    jasmineReact.spyOnClass(window.trackerSuite, "collect").and.returnValue [
      {"user_id":1,"id":1,"created_at":"2015-05-22T04:55:19.639Z","updated_at":"2015-05-22T04:55:19.639Z","name":"asdasd","total":4},
      {"user_id":1,"id":2,"created_at":"2015-05-22T05:26:30.110Z","updated_at":"2015-05-22T05:26:30.110Z","name":"xxxx","total":4}
    ]
    @element = React.createElement(window.trackerSuite)
    jasmineReact.render @element

    #console.log($('#trackers div.tracker'))
    #expect($('#trackers div.tracker').size()).toEqual(2)
