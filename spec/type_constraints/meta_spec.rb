require 'spec_helper'
require 'type_constraints/meta'

describe TypeConstraints::Meta do
  describe "#initialize" do
    context "Create new instance" do
      meta = TypeConstraints::Meta.new(name: :AlwaysTrue, constraint: -> v { true })
      it "returns TypeConstraints::Meta Object" do
        expect(meta.class).to eq TypeConstraints::Meta
      end
    end
  end

  describe "#check?" do
    context "Without parent Object." do
      meta = TypeConstraints::Meta.new(name: :AlwaysTrue, constraint: -> v { true })
      it "returns TrueClass Object" do
        result = meta.check?("hogehoge")
        expect(result).to eq true
      end
    end

    context "With parent Object" do
      parent = TypeConstraints::Meta.new(name: :AlwaysTrue, constraint: -> v { false })
      meta   = TypeConstraints::Meta.new(
        name: :AlwaysTrue,
        constraint: -> v { true },
        parent: parent
      )

      it "returns TrueClass Object" do
        result = meta.check?("hogehoge")
        expect(result).to eq false
      end
    end
  end

  describe "#check!" do
    context "Without parent Object." do
      meta = TypeConstraints::Meta.new(name: :AlwaysTrue, constraint: -> v { true })
      it "returns TrueClass Object" do
        result = meta.check!("hogehoge")
        expect(result).to eq true
      end
    end

    context "With parent Object" do
      parent = TypeConstraints::Meta.new(name: :AlwaysTrue, constraint: -> v { false })
      meta   = TypeConstraints::Meta.new(
        name: :AlwaysTrue,
        constraint: -> v { true },
        parent: parent
      )

      it "returns FalseClass Object" do
        expect { meta.check!("hogehoge") }.to raise_error(TypeConstraints::Exceptions::Invalid)
      end
    end
  end

end
