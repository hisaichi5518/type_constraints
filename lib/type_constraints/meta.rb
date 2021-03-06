module TypeConstraints
  class Meta

    attr_accessor :name, :parent
    def initialize(args={})
      @name       = args[:name]
      @parent     = args[:parent]
      @constraint = args[:constraint]
    end

    def constraint(v=nil)
      @constraint = v if !v.nil?
      @constraint
    end

    def check?(val)
      if !parent.nil? && !parent.check?(val)
        return false
      end
      constraint.call(val)
    end

    def check!(val, level=1)
      check?(val) or raise InvalidError, nil, caller(level)
    end
  end
end
