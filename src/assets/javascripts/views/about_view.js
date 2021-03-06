// Generated by CoffeeScript 1.12.7
(function() {
  var bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    hasProp = {}.hasOwnProperty;

  com.wintondeshong.views.AboutView = (function(superClass) {
    extend(AboutView, superClass);

    function AboutView() {
      this._handleToggle = bind(this._handleToggle, this);
      this.render = bind(this.render, this);
      this.initialize = bind(this.initialize, this);
      return AboutView.__super__.constructor.apply(this, arguments);
    }

    AboutView.prototype.el = '#about-page';

    AboutView.prototype.events = {
      'click .expandable': '_handleToggle'
    };

    AboutView.prototype.initialize = function(options) {};

    AboutView.prototype.render = function() {
      return this.$el;
    };

    AboutView.prototype._handleToggle = function(e) {
      var $container, $frameworks, $title, isVisible;
      $container = $(e.currentTarget);
      $frameworks = $container.find('ul');
      $title = $container.find('.title');
      if ($frameworks.length) {
        isVisible = $container.hasClass('expanded');
        $container.addClass(isVisible ? 'collapsed' : 'expanded');
        return $container.removeClass(isVisible ? 'expanded' : 'collapsed');
      }
    };

    return AboutView;

  })(Backbone.View);

}).call(this);
