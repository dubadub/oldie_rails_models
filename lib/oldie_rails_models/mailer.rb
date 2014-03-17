module OldieRailsModels::Mailer

  def self.method_missing(method_name, *args)
    p "method_name #{method_name}"

    super

  end

end
