class com.wintondeshong.views.MainView extends Backbone.View

  # Properties
  # -------------------------------------

  events:
    'click .preview': '_handlePreviewClick'
    'click .details': '_handleDetailsClick'


  # Initialization
  # -------------------------------------

  initialize: (options) =>
    @$el = $('#main-view')
    @el  = @$el.get(0)


  # Public API
  # -------------------------------------

  render: =>
    @$el.find('.project-tile').each (index, tile) ->
      $(tile).css('display', 'block').fadeOut(0).delay(150 * index).fadeIn()
    @$el


  # Private API
  # -------------------------------------

  _isTargetPermitted: (target) =>
    $(target).prop('tagName') is 'A'

  _toggleContainers: ($containerToHide, containerToShow) =>
    $tile            = $containerToHide.closest('.project-tile')
    $containerToShow = $tile.find(containerToShow)

    $tile.animate { opacity: 0 },
      complete: () =>
        $containerToHide.css 'display', 'none'
        $containerToShow.css 'display', 'block'
        $tile.animate { opacity: 1 }


  # Event Handlers
  # -------------------------------------

  _handleDetailsClick: (e) =>
    return if @_isTargetPermitted(e.target)
    e.preventDefault()

    $detailContainer = $(e.currentTarget)
    @_toggleContainers $detailContainer, '.preview'

  _handlePreviewClick: (e) =>
    return if @_isTargetPermitted(e.target)
    e.preventDefault()

    $previewContainer = $(e.currentTarget)
    @_toggleContainers $previewContainer, '.details'
