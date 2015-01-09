require "type_constraints/version"
require "type_constraints/registry"
require "type_constraints/meta"
require "type_constraints/exceptions"

module TypeConstraints
  class << self
    attr_accessor :registry
    def setup(&code)
      @registry = Registry.new
      @registry.instance_eval(&code)
      @registry
    end

    def check?(name, val)
      return false if registry.metas[name].nil?
      registry.metas[name].check?(val)
    end

    def check!(name, val, level=1)
      raise Exceptions::MissingMeta, nil, caller(level) if registry.metas[name].nil?
      registry.metas[name].check!(val, level+1)
    end
  end
end

require "type_constraints/type/default"
