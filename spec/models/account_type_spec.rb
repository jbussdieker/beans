require 'spec_helper'

describe AccountType do
  it "has a valid factory" do
    FactoryGirl.build(:account_type).should be_valid
  end

  describe "to_s" do
    subject { FactoryGirl.build(:account_type) }

    it "should return the name" do
      subject.to_s.should == subject.name
    end
  end
end
