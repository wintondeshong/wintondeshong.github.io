// Generated by CoffeeScript 1.12.7
(function() {
  var bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    hasProp = {}.hasOwnProperty;

  com.wintondeshong.views.ContactView = (function(superClass) {
    extend(ContactView, superClass);

    function ContactView() {
      this._handleSaveSuccess = bind(this._handleSaveSuccess, this);
      this._handleSaveError = bind(this._handleSaveError, this);
      this._handleValidModelProperty = bind(this._handleValidModelProperty, this);
      this._handleInvalidModelProperty = bind(this._handleInvalidModelProperty, this);
      this._handleChange = bind(this._handleChange, this);
      this._updateModel = bind(this._updateModel, this);
      this._showValidationMessage = bind(this._showValidationMessage, this);
      this._showSuccessMessage = bind(this._showSuccessMessage, this);
      this._showSubmitButton = bind(this._showSubmitButton, this);
      this._hideValidationMessage = bind(this._hideValidationMessage, this);
      this._hideSubmitButton = bind(this._hideSubmitButton, this);
      this._attachModelEvents = bind(this._attachModelEvents, this);
      this.render = bind(this.render, this);
      this._initializeElements = bind(this._initializeElements, this);
      this.initialize = bind(this.initialize, this);
      return ContactView.__super__.constructor.apply(this, arguments);
    }

    ContactView.prototype._$fieldEmail = null;

    ContactView.prototype._$fieldMessage = null;

    ContactView.prototype._$fieldName = null;

    ContactView.prototype._$submitButton = null;

    ContactView.prototype._$successMessage = null;

    ContactView.prototype._$validationMessage = null;

    ContactView.prototype.events = {
      'blur input': '_handleChange',
      'keydown input': '_handleChange',
      'keydown textarea': '_handleChange'
    };

    ContactView.prototype.id = 'contact-view';

    ContactView.prototype.initialize = function(options) {
      this.model = new com.wintondeshong.models.Contact();
      this._attachModelEvents();
      return this;
    };

    ContactView.prototype._initializeElements = function() {
      this._$fieldEmail = this.$el.find('input[name="email"]');
      this._$fieldMessage = this.$el.find('textarea[name="message"]');
      this._$fieldName = this.$el.find('input[name="name"]');
      this._$submitButton = this.$el.find('#submit-button');
      this._$successMessage = this.$el.find('#success-message');
      return this._$validationMessage = this.$el.find('#validation-message');
    };

    ContactView.prototype.render = function() {
      this.$el.fadeOut(0);
      this.$el.html(com.wintondeshong.app.templates.templateContact(this.model));
      this.$el.fadeIn();
      this._initializeElements();
      return this;
    };

    ContactView.prototype._attachModelEvents = function() {
      this.model.on('invalid:email', this._handleInvalidModelProperty);
      this.model.on('invalid:message', this._handleInvalidModelProperty);
      this.model.on('invalid:name', this._handleInvalidModelProperty);
      this.model.on('valid:email', this._handleValidModelProperty);
      this.model.on('valid:message', this._handleValidModelProperty);
      return this.model.on('valid:name', this._handleValidModelProperty);
    };

    ContactView.prototype._hideSubmitButton = function() {
      return this._$submitButton.fadeOut();
    };

    ContactView.prototype._hideValidationMessage = function() {
      return this._$validationMessage.fadeOut('slow');
    };

    ContactView.prototype._showSubmitButton = function() {
      return this._$submitButton.fadeIn();
    };

    ContactView.prototype._showSuccessMessage = function() {
      return this._$successMessage.css('display', 'block').fadeOut(0).fadeIn();
    };

    ContactView.prototype._showValidationMessage = function() {
      return this._$validationMessage.fadeIn('slow');
    };

    ContactView.prototype._updateModel = function() {
      this.model.set({
        name: this._$fieldName.val(),
        email: this._$fieldEmail.val(),
        message: this._$fieldMessage.val()
      });
      if (this.model.isValid()) {
        return this._hideValidationMessage();
      } else {
        return this._showValidationMessage();
      }
    };

    ContactView.prototype._handleChange = function(e) {
      return this._updateModel();
    };

    ContactView.prototype._handleInvalidModelProperty = function(error) {
      var typeCap;
      typeCap = _(error.type).capitalize();
      return this["_$field" + typeCap].addClass('validation-error');
    };

    ContactView.prototype._handleValidModelProperty = function(error) {
      var typeCap;
      typeCap = _(error.type).capitalize();
      return this["_$field" + typeCap].removeClass('validation-error');
    };

    ContactView.prototype._handleSaveError = function(model, response, options) {
      return this._showSubmitButton();
    };

    ContactView.prototype._handleSaveSuccess = function(model, response, options) {
      return this._showSuccessMessage();
    };

    return ContactView;

  })(Backbone.View);

}).call(this);