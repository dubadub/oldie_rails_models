require 'oldie_rails_models/model'
require 'oldie_rails_models/mailer'


if defined? Rails
  ActiveSupport.on_load(:active_record) do
    extend OldieRailsModels::Model
  end

  ActiveSupport.on_load(:action_controller) do
    module ActionController
      module UrlWriter
        include Rails.application.routes.url_helpers if Rails.application.present?
      end
    end
  end

end
