require 'spec_helper'

describe "IfStatement" do
  describe "#setup" do
    it "should set Boolean arguments" do
      IfStatement.setup do
        set :messaging, true
      end

      IfStatement.features[:messaging].should be_true
    end

    it "should set block arguments" do
      block = Proc.new { 1 + 2 }
      IfStatement.setup do
        set :addition, &block
      end

      IfStatement.features[:addition].should == block
    end
  end

  describe "#define" do
    it "should accept a boolean value" do
      IfStatement.define :sidebar, false

      IfStatement.features[:sidebar].should_not be_nil
      IfStatement.features[:sidebar].should be_false
    end

    it "should accept a block" do
      block = Proc.new { 1 + 2 }
      IfStatement.define :addition, &block

      IfStatement.features[:addition].should == block
    end

    it "should force the identifier to a symbol" do
      IfStatement.define 'odeo', true

      IfStatement.features['odeo'].should be_nil
      IfStatement.features[:odeo].should be_true
    end
  end

  describe "#read" do
    it "should return false for nil values" do
      undefined = IfStatement.read(:not_defined)

      undefined.should_not be_nil
      undefined.should be_false
    end

    it "should return the block for block values" do
      block = Proc.new { 3 + 4 }
      IfStatement.define :seven, &block

      IfStatement.read(:seven).should == block
    end
  end
end
