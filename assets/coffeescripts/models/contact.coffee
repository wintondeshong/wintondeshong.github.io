class com.wintondeshong.models.Contact extends Backbone.Model

  # Properties
  # ----------

  defaults:
    name: ''
    email: ''
    message: ''

  url: '/contact_send'


  # Public Methods
  # --------------

  validate: (attrs) =>
    hasErrors = false

    for attr, value of @attributes
      attrCap = _(attr).capitalize()
      attrValidation = @["_validate#{attrCap}"]()

      if attrValidation is true
        @trigger "valid:#{attr}", { type: attr, message: "#{attr} is valid" }
      else
        @trigger "invalid:#{attr}", { type: attr, message: attrValidation }
        hasErrors = true

    hasErrors


  getEmail: =>
    @get('email')

  getMessage: =>
    @get('message')

  getName: =>
    @get('name')

  setEmail: (email) =>
    @set 'email', $.trim(email)

  setMessage: (message) =>
    @set 'message', $.trim(message)

  setName: (name) =>
    @set 'name', $.trim(name)


  # Private Methods
  # ---------------

  _validateEmail: =>
    email = @getEmail()
    return 'email is required' if _(email).isEmpty()
    true

  _validateMessage: =>
    message = @getMessage()
    return 'message is required' if _(message).isEmpty()
    true

  _validateName: =>
    name = @getName()
    return 'name is required' if _(name).isEmpty()
    true
