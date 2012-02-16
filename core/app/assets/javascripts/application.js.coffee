
require ['jquery', 'backbone', 'TheApp'], ($, Backbone, TheApp) ->
  # Start up the app once the DOM is ready
  $ ->
    window.App = new TheApp()
    Backbone.history.start
      pushState: true
    window.App.start()