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

        h.inject(self) do |s, (key, value)|
          case key
          when :conditions
            s.where(value)
          when :order
            s.order(value)
          when :joins
            s.joins(value)
          end
        end
      }
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

    # def before_destroy

    # end

    # validates_acceptance_of (<= v2.3.8)
    # validates_associated (<= v2.3.8)
    # validates_confirmation_of (<= v2.3.8)
    # validates_exclusion_of (<= v2.3.8)
    # validates_format_of (<= v2.3.8)
    # validates_inclusion_of (<= v2.3.8)
    # validates_length_of (<= v2.3.8)
    # validates_numericality_of (<= v2.3.8)
    # validates_presence_of (<= v2.3.8)
    # validates_size_of (<= v2.3.8)
    # validates_uniqueness_of (<= v2.3.8)

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
