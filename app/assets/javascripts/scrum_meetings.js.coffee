window.ScrumMeetings =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}

$(document).ready ->
  window.SMApp = new Backbone.Marionette.Application();
  SMApp.addInitializer(->
    new ScrumMeetings.Routers.Projects()
    Backbone.history.start()
  )
  SMApp.addRegions(
    aside: "#aside-container"
    main: "#main-container"
  )
  SMApp.start()