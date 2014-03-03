require 'spec_helper'

describe Account do
  it "has a valid factory" do
    FactoryGirl.build(:account).should be_valid
  end

  describe "to_s" do
    subject { FactoryGirl.build(:account) }

    it "should return the name" do
      subject.to_s.should == subject.name
    end
  end

  it { should belong_to(:user) }
  it { should belong_to(:account_type) }
  it { should have_many(:journals) }
end
