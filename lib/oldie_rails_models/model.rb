module OldieRailsModels::Model

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

  def set_table_name(*args)
    self.table_name = *args
  end

  def conditions(*args)
    where *args
  end

  def conditions(*args)
    where *args
  end

  def attr_accessible(*args); end

end
