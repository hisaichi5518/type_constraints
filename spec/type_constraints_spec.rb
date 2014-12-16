require 'spec_helper'

describe TypeConstraints do

  TypeConstraints.setup do
    type :TypeName do
      constraint -> v { v.kind_of?(Array) }
    end
    subtype :TypeName2, :TypeName do
      constraint -> array {
        array.all? do |v|
          v.kind_of?(String)
        end
      }
    end
  end

  describe "#setup" do
    it "Created registry" do
      expect(TypeConstraints.registry.class).to eq TypeConstraints::Registry
    end

    it "registry has TypeName meta" do
      expect(TypeConstraints.registry.metas[:TypeName].nil?).to eq false
      expect(TypeConstraints.registry.metas[:TypeName].constraint.class).to eq Proc
    end
  end

  describe "#check?" do
    it "return true if passed :TypeName and array" do
      expect(TypeConstraints.check?(:TypeName, [100,101,102])).to eq true
    end
    it "return false if passed :TypeName and integer" do
      expect(TypeConstraints.check?(:TypeName, 10000000000000)).to eq false
    end

    it "return true if passed :TypeName2 and Array[string]" do
      expect(TypeConstraints.check?(:TypeName2, ["100", "200"])).to eq true
    end
    it "return false if passed :TypeName2 and Array[integer]" do
      expect(TypeConstraints.check?(:TypeName2, [100, 200])).to eq false
    end

    it "return false if not exists meta" do
      expect(TypeConstraints.check?(:Hoge, [100, 200])).to eq false
    end
  end
end
