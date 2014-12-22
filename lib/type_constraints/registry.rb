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

    # hash_type :Test, :key_name, ...
    def hash_type(name, *keys, &code)
      meta = Meta.new(name: name, parent: metas[:Hash], constraint: -> v { keys.all?() {|k| v.key?(k)} })
      meta.instance_eval(&code) if code
      metas[name] = meta
    end
  end
end
