require 'spec_helper'
require 'type_constraints/type/default'

describe TypeConstraints::Type::Default do
  it "return true" do
    TypeConstraints.check?(:String, "test")
  end
end
