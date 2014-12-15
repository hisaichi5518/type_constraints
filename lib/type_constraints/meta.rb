module TypeConstraints
  class Meta

    attr_accessor :name, :parent, :constraint
    def initialize(args={})
      @name       = args[:name]
      @parent     = args[:parent]
      @constraint = args[:constraint]
    end

    def check?(val)
      if !parent.nil? && !parent.check?(val)
        return false
      end
      constraint.call(val)
    end
  end
end
