module OldieRailsModels
  module Mailer

    def method_missing(method_name, *args)
      if method_name =~ /\Adeliver_.+\Z/
        send(method_name.to_s.scan(/deliver_(.+)/).flatten.first.to_sym, *args)
      else
        super
      end
    end

    def respond_to?(method_name, include_private = false)
      if method_name =~ /\Adeliver_.+\Z/
        true
      else
        super
      end
    end

  end
end
