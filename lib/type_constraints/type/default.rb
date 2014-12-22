module TypeConstraints
  module Type
    module Default
    end
  end
end

module TypeConstraints::Type::Default
  DEFAULT_TYPES = {
    BasicObject:   [-> v { v.kind_of?(BasicObject) }],
    Object:        [-> v { v.kind_of?(Object) }, :BasicObject],
    Hash:          [-> v { v.kind_of?(Hash) }, :Object],
    Array:         [-> v { v.kind_of?(Array) }, :Object],
    Method:        [-> v { v.kind_of?(Method) }, :Object],
    UnboundMethod: [-> v { v.kind_of?(UnboundMethod) }, :Object],
    String:        [-> v { v.kind_of?(String) }, :Object],
    Symbol:        [-> v { v.kind_of?(Symbol) }, :Object],
    Range:         [-> v { v.kind_of?(Range) }, :Object],
    Exception:     [-> v { v.kind_of?(Exception) }, :Object],
    NilClass:      [-> v { v.kind_of?(NilClass) }, :Object],
    TrueClass:     [-> v { v.kind_of?(TrueClass) }, :Object],
    FalseClass:    [-> v { v.kind_of?(FalseClass) }, :Object],
    Regexp:        [-> v { v.kind_of?(Regexp) }, :Object],
    Time:          [-> v { v.kind_of?(Time) }, :Object],
    MatchData:     [-> v { v.kind_of?(MatchData) }, :MatchData],
    Proc:          [-> v { v.kind_of?(Proc) }, :Object],
    Module:        [-> v { v.kind_of?(Module) }, :Object],
    Class:         [-> v { v.kind_of?(Class) }, :Module],
    Numeric:       [-> v { v.kind_of?(Numeric) }, :Object],
    Float:         [-> v { v.kind_of?(Float) }, :Numeric],
    Integer:       [-> v { v.kind_of?(Integer) }, :Numeric],
    Bignum:        [-> v { v.kind_of?(Bignum) }, :Integer],
    Fixnum:        [-> v { v.kind_of?(Fixnum) }, :Integer],
    Bignum:        [-> v { v.kind_of?(Bignum) }, :Integer],
    Fixnum:        [-> v { v.kind_of?(Fixnum) }, :Integer],
  }.freeze

  TypeConstraints.setup do
    DEFAULT_TYPES.each do |key, array|
      if array[1] # has parent
        subtype(key, array[1]) do
          constraint array[0]
        end
      else
        type(key) do
          constraint array[0]
        end
      end
    end
  end
end
