div = React.createFactory 'div'
em = React.createFactory 'em'
a = React.createFactory 'a'
button = React.createFactory 'button'
input = React.createFactory 'input'


TrackerSuite = React.createClass

  displayName: 'TrackerSuite'

  getInitialState: ->
    trackers: []

  componentWillMount: ->
    @sync()

  sync: ->
    request = $.ajax
      url: '/trackers.json',
      method: 'get'
      success: (result) =>
        @setState trackers: result

  render: ->
    div {},
      @state.trackers.map (tracker) =>
        Tracker
          key: tracker.id
          tracker: tracker
          trackerUpdateClicked: @trackerUpdateClicked
          trackerDeleteClicked: @trackerDeleteClicked
      CreateTracker
        createTracker: @createTracker

  createTracker: (name, callback) ->
    request = $.ajax
      url: '/trackers.json',
      method: 'post'
      data: {'tracker[name]': name}
      success: (result) =>
        @sync()
        callback()

  trackerUpdateClicked: (tracker, callback) ->
    request = $.ajax
      url: '/trackers/' + tracker.id + '/datapoints.json',
      method: 'post'
      data: {'datapoint[value]': 1}
      success: (result) =>
        @sync()
        callback()

  trackerDeleteClicked: (tracker, callback) ->
    request = $.ajax
      url: '/trackers/' + tracker.id + '.json',
      method: 'delete'
      success: (result) =>
        @sync()


Tracker = React.createClass

  displayName: 'Tracker'

  getInitialState: ->
    disabled: false

  disable: ->
    @setState disabled: true

  enable: ->
    @setState disabled: false

  onButtonClick: ->
    @disable()
    @props.trackerUpdateClicked @props.tracker, @enable

  onDeleteClick: ->
    @disable()
    @props.trackerDeleteClicked @props.tracker

  render: ->
    div {className: 'tracker'},
      button {onClick: @onButtonClick, disabled: @state.disabled}, @props.tracker.name
      em {className: 'total'}, @props.tracker.total
      a {onClick: @onDeleteClick}, 'x'

Tracker = React.createFactory(Tracker);


CreateTracker = React.createClass

  displayName: 'CreateTracker'

  clearText: ->
    @refs.text.getDOMNode().value = ''

  keyPressed: (event) ->
    if event.charCode == 13
      @props.createTracker event.target.value, =>
        @clearText()

  render: ->
    div {},
      input {type: 'text', ref: 'text', placeholder: 'Name something you want to track...', onKeyPress: @keyPressed}

CreateTracker = React.createFactory(CreateTracker);


window.attachTrackerSuite = (element) ->
  React.render React.createElement(TrackerSuite), element.get(0)
