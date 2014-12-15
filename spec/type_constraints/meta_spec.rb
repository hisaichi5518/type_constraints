require 'spec_helper'
require 'type_constraints/meta'

describe TypeConstraints::Meta do
  describe "#initialize" do
    context "Create new instance" do
      meta = TypeConstraints::Meta.new(name: :AlwaysTrue, constraint: proc { |v| true })
      it "returns TypeConstraints::Meta Object" do
        expect(meta.class).to eq TypeConstraints::Meta
      end
    end
  end

  describe "#check?" do
    context "Check string object." do
      meta = TypeConstraints::Meta.new(name: :AlwaysTrue, constraint: proc { |v| true })
      it "returns TrueClass Object" do
        result = meta.check?("hogehoge")
        expect(result).to eq true
      end
    end

    context "With parent Object" do
      parent = TypeConstraints::Meta.new(name: :AlwaysTrue, constraint: proc { |v| false })
      meta   = TypeConstraints::Meta.new(name: :AlwaysTrue, constraint: proc { |v| true }, parent: parent)

      it "returns TrueClass Object" do
        result = meta.check?("hogehoge")
        expect(result).to eq false
      end
    end
  end

end
