class com.wintondeshong.views.AboutView extends Backbone.View

  el: '#about-page'

  events:
    'click .expandable': '_handleToggle'

  initialize: (options) =>

  render: =>
    @$el

  _handleToggle: (e) =>
    $container  = $(e.currentTarget)
    $frameworks = $container.find('ul')
    $title      = $container.find('.title')

    if $frameworks.length
      isVisible = $container.hasClass('expanded')
      $container.addClass(if isVisible then 'collapsed' else 'expanded')
      $container.removeClass(if isVisible then 'expanded' else 'collapsed')
