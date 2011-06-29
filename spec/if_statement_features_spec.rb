require 'spec_helper'

class User
  include IfStatement::Features

  def admin?
    true
  end
end

def one_hundred!
  10 * 10
end

class View
  include IfStatement::Features

  def with_output_buffer
  end
end

IfStatement.define(:dummy, true)
IfStatement.define(:count) { 7 + 5 }
IfStatement.define(:admin) { admin? }
IfStatement.define(:falsy) { true and false }

describe "IfStatement::Features" do
  before do
    @user = User.new
    @view = View.new
  end

  describe "#feature?" do
    it "should return the value of a Boolean feature" do
      @user.feature?(:dummy).should be_true
    end

    it "should evaluate the result of a block argument as truthy" do
      @user.feature?(:count).should == true
    end

    it "should give the block argument access to its methods" do
      @user.feature?(:admin).should == true
    end
  end

  describe "#feature" do
    describe "when the feature is enabled" do
      it "should call with_output_buffer if it's available" do
        @view.should_receive(:with_output_buffer)

        @view.feature(:dummy) { nil }
      end

      it "should execute the block otherwise" do
        actual = @user.feature :admin do
          one_hundred!
        end

        actual.should == 100
      end
    end

    it "should return nil if the feature is disabled" do
      actual = @user.feature :falsy do
        one_hundred!
      end

      actual.should be_nil
    end

    it "should return nil if the feature is undefined" do
      actual = @user.feature :not_defined do
        one_hundred!
      end

      actual.should be_nil
    end

  end
end
