module OldieRailsModels

  def named_scope(*args)
    scope *args
  end

  def validate_on_create(*args)
    args.last.merge(on: :create) if args.last.is_a?(Hash)
    validate *args
  end

  def validate_on_update(*args)
    args.last.merge(on: :update) if args.last.is_a?(Hash)
    validate *args
  end

  def before_validation_on_create(*args)
    args.last.merge(on: :create) if args.last.is_a?(Hash)
    before_validation *args
  end

  def before_validation_on_update(*args)
    args.last.merge(on: :update) if args.last.is_a?(Hash)
    before_validation *args
  end

  def set_primary_key(*args)
    # self.primary_key = *args
  end

  def conditions(*args)
    where *args
  end

  def attr_accessible(*args); end

end

if defined? Rails
  ActiveSupport.on_load(:active_record) do
    extend OldieRailsModels
  end

  ActiveSupport.on_load(:action_controller) do
    module ActionController
      module UrlWriter
        include Rails.application.routes.url_helpers if Rails.application.present?
      end
    end
  end
end
