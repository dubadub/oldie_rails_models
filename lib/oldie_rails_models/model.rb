module OldieRailsModels
  module Model

    def named_scope(*args)
      name, opts, block = args

      scope name, ->(*p) {

        h = case opts
        when Hash
          opts
        when Proc
          opts.call(*p)
        end

        scoped(h)
      }
    end

    def scoped(h)
      h.inject(self) do |s, (key, value)|
        case key
        when :conditions
          s.where(value)
        when :order
          s.order(value)
        when :joins
          s.joins(value)
        when :limit
          s.limit(value)
        when :include
          s.includes(value)
        when :offset
          s.offset(value)
        when :group
          s.group(value)
        when :having
          s.having(value)
        end
      end
    end

    def validate_on_create(*args)
      validate *add_parameter(args, { on: :create })
    end

    def validate_on_update(*args)
      validate *add_parameter(args, { on: :update })
    end

    def before_validation_on_create(*args)
      before_validation *add_parameter(args, { on: :create })
    end

    def before_validation_on_update(*args)
      before_validation *add_parameter(args, { on: :update })
    end

    def set_primary_key(*args)
      # self.primary_key = *args
    end

    def set_table_name(*args)
      self.table_name = *args
    end

    def attr_accessible(*args); end

    private

    def add_parameter(arr, h)
      if arr.last.is_a?(Hash)
        arr.last.merge(h) if arr.last.is_a?(Hash)
      else
        arr << h
      end
    end

  end
end
