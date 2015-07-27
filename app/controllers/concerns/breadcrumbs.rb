module Breadcrumbs
  extend ActiveSupport::Concern

  included do
    helper_method :breadcrumbs
  end

  class_methods do
    def add_breadcrumb(&block)
      controller_class = self
      before_action do
        options = block ? instance_exec(&block) : {}
        title = options.fetch(:title) { controller_class.breadcrumbs_i18n_title :scope, options }
        breadcrumbs << { title: title, url: options[:url] }
      end
    end

    def breadcrumbs_i18n_scope
      [:breadcrumbs] | name.underscore.gsub('_controller', '').split('/')
    end

    def breadcrumbs_i18n_title(key, locals = {})
      default_key = "breadcrumbs.defaults.#{key}"
      if I18n.exists? default_key
        default = I18n.t default_key
      end

      I18n.t key, locals.merge(scope: breadcrumbs_i18n_scope, default: default)
    end
  end

  def breadcrumbs
    @_breadcrumbs ||= []
  end

  def add_breadcrumb(locals = {})
    key =
        case action_name
        when 'update' then 'edit'
        when 'create' then 'new'
        else action_name
        end
    title = self.class.breadcrumbs_i18n_title key, locals
    breadcrumbs << { title: title }
  end
end
