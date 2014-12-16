require 'spec_helper'
require 'type_constraints/registry'

describe TypeConstraints::Registry do

  describe "#type" do
    before do
      @r = TypeConstraints::Registry.new
      @r.type(:ParentConstraint) { }
    end

    it "Sets meta object for metas" do
      expect(@r.metas.size).to eq 1
    end
    it "Sets subtype meta" do
      expect(@r.metas[:ParentConstraint].nil?).to eq false
    end
  end

  describe "#subtype" do
    before do
      @r = TypeConstraints::Registry.new
      @r.type(:ParentConstraint) { }
      @r.subtype(:ChildConstraint, :ParentConstraint) { }
    end

    it "Sets meta object for metas" do
      expect(@r.metas.size).to eq 2
    end
    it "Sets subtype meta" do
      expect(@r.metas[:ChildConstraint].nil?).to eq false
    end
  end
end
