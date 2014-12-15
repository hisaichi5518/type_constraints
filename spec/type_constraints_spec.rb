require 'spec_helper'

describe TypeConstraints do
  it 'has a version number' do
    expect(TypeConstraints::VERSION).not_to be nil
  end

  describe "#set, #get" do
    context "String Object is a String" do
      it "return true" do
        expect(TypeConstraints.get(:String).call("this is a String.")).to eq true
      end
    end

    context "Integer Object is not a String" do
      it "return false" do
        expect(TypeConstraints.get(:String).call(100000)).to eq false
      end
    end
  end
end
