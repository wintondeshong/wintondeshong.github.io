namespace = com.wintondeshong

class namespace.App extends Backbone.Router

  # Properties
  # -------------------------------------

  _currentView: null
  _$container: null

  routes:
    '*path' : '_handleRoute'


  # Initialization
  # -------------------------------------

  initialize: (options) =>
    console.log "App.Router start"
    @_$container = $('#application-shell')
    namespace.app.templates = new namespace.TemplateManager()
    namespace.app.templates.initialize()
    Backbone.history.start();


  # Private API
  # -------------------------------------

  _getViewNameFromRoute: =>
    route = window.location.pathname.replace('/', '')
    if _(route).isEmpty()
      "MainView"
    else
      route.charAt(0).toUpperCase() + route.slice(1) + "View"


  # Event Handlers
  # -------------------------------------

  _handleRoute: =>
    viewName      = @_getViewNameFromRoute()
    viewClass     = namespace.views[viewName]
    if viewClass
      @_currentView = new viewClass()
      @_$container.html @_currentView.render().$el
