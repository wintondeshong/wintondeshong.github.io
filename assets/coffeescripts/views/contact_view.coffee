class com.wintondeshong.views.ContactView extends Backbone.View

  # Properties
  # ----------

  _$fieldEmail:        null
  _$fieldMessage:      null
  _$fieldName:         null
  _$submitButton:      null
  _$successMessage:    null
  _$validationMessage: null

  events:
    'blur input':           '_handleChange'
    'keydown input':        '_handleChange'
    'keydown textarea':     '_handleChange'

  id: 'contact-view'


  # Init
  # ----

  initialize: (options) =>
    @model = new com.wintondeshong.models.Contact()
    @_attachModelEvents()
    @


  _initializeElements: =>
    @_$fieldEmail        = @$el.find('input[name="email"]')
    @_$fieldMessage      = @$el.find('textarea[name="message"]')
    @_$fieldName         = @$el.find('input[name="name"]')
    @_$submitButton      = @$el.find('#submit-button')
    @_$successMessage    = @$el.find('#success-message')
    @_$validationMessage = @$el.find('#validation-message')


  # Public Methods
  # --------------

  render: =>
    @$el.fadeOut(0)
    @$el.html(com.wintondeshong.app.templates.templateContact(@model))
    @$el.fadeIn()
    @_initializeElements()
    @


  # Private Methods
  # ---------------

  _attachModelEvents: =>
    @model.on 'invalid:email',   @_handleInvalidModelProperty
    @model.on 'invalid:message', @_handleInvalidModelProperty
    @model.on 'invalid:name',    @_handleInvalidModelProperty

    @model.on 'valid:email',   @_handleValidModelProperty
    @model.on 'valid:message', @_handleValidModelProperty
    @model.on 'valid:name',    @_handleValidModelProperty

  _hideSubmitButton: =>
    @_$submitButton.fadeOut()

  _hideValidationMessage: =>
    @_$validationMessage.fadeOut 'slow'

  _showSubmitButton: =>
    @_$submitButton.fadeIn()

  _showSuccessMessage: =>
    @_$successMessage.css('display', 'block').fadeOut(0).fadeIn()

  _showValidationMessage: =>
    @_$validationMessage.fadeIn 'slow'

  _updateModel: =>
    @model.set
      name:    @_$fieldName.val()
      email:   @_$fieldEmail.val()
      message: @_$fieldMessage.val()

    if @model.isValid()
      @_hideValidationMessage()
    else
      @_showValidationMessage()


  # Event Handlers
  # --------------

  _handleChange: (e) =>
    @_updateModel()

  _handleInvalidModelProperty: (error) =>
    typeCap = _(error.type).capitalize()
    @["_$field#{typeCap}"].addClass 'validation-error'

  _handleValidModelProperty: (error) =>
    typeCap = _(error.type).capitalize()
    @["_$field#{typeCap}"].removeClass 'validation-error'

  _handleSaveError: (model, response, options) =>
    @_showSubmitButton()

  _handleSaveSuccess: (model, response, options) =>
    @_showSuccessMessage()

