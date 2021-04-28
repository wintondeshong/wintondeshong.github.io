com.wintondeshong.TemplateManager = function () {
    var api = {
        initialize : function () {
            var $hamlTemplates = $('script[type="text/haml-js-tmpl"]');
            $hamlTemplates.each(_.bind(function (i, template) {
                api[template.id] = Haml($.trim($(template).html()));
            }, this));
        }
    };
    return api;
};
