require "type_constraints/version"

module TypeConstraints
  def self.get(name)
    @@types ||= {}
    @@types[name]
  end

  def self.set(name, &code)
    @@types ||= {}
    @@types[name] = code
  end

  [
    :Array,
    :BasicObject,
    :Bignum,
    :Class,
    :Comparable,
    :Dir,
    :Encoding,
    :Enumerable,
    :Enumerator,
    :Exception,
    :FalseClass,
    :File,
    :Fixnum,
    :Float,
    :Hash,
    :Integer,
    :IO,
    :Kernel,
    :MatchData,
    # :Math,
    :Method,
    :Module,
    :NilClass,
    :Numeric,
    :Object,
    # :Precision,
    :Proc,
    :Range,
    :Regexp,
    :String,
    :Symbol,
    :Time,
    # :Thread,
    :TrueClass,
    :UnboundMethod,
  ].each do |sym|
    klass = Object.const_get(sym.to_s)
    set sym do |val|
      val.kind_of?(klass)
    end
  end
end
