module TypeConstraints
  class Registry
    attr_accessor :metas
    def initialize
      @metas = {}
    end

    def type(name, &code)
      meta = Meta.new(name: name)
      meta.instance_eval(&code)
      metas[name] = meta
    end

    def subtype(name, parent, &code)
      meta = Meta.new(name: name, parent: metas[parent])
      meta.instance_eval(&code)
      metas[name] = meta
    end
  end
end
