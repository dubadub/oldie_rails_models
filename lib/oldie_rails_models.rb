module OldieRailsModels

  def named_scope(*args)
    scope *args
  end

  def validate_on_create(*args)
    validate *args, on: :create
  end

  def validate_on_update(*args)
    validate *args, on: :update
  end

  def before_validation_on_create(*args)
    before_validation *args, on: :create
  end

  def before_validation_on_update(*args)
    before_validation *args, on: :update
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
