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

        parent_scoped(h, self)
      }
    end

    def parent_scoped(h, parent)
      h.inject(parent) do |s, (key, value)|
        case key
        when :conditions
          s.where(value)
        when :select
          s.select(value)
        when :order
          s.order(value)
        when :joins
          s.joins(value)
        when :limit
          s.limit(value)
        when :includes
          s.includes(value)
        when :offset
          s.offset(value)
        when :group
          s.group(value)
        when :having
          s.having(value)
        when :finder_sql
          s.find_by_sql(value)
        when :count
          s.where(value).count
        end
      end
    end

    def default_scope(*args)
      opts, block = args

      super ->(*p) {

        h = case opts
        when Hash
          opts
        when Proc
          opts.call(*p)
        end

        parent_scoped(h, self)
      }
    end

    def scoped(h)
      parent_scoped(h, self)
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

    def has_many(*args)
      name, opts, block = args

      case opts
        when Hash
          finders = {}
          [
            :conditions,
            :order,
            :joins,
            :limit,
            :include,
            :offset,
            :group,
            :having,
            :finder_sql
          ].each do |k|
            if opts[k]
              finders[k] = opts[k]
              opts.delete(k)
            end
          end
          super(name, -> { parent_scoped(finders, self) }, opts)
        else
          super
        end
    end

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


