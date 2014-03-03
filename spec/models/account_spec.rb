require 'spec_helper'

describe Account do
  it "has a valid factory" do
    FactoryGirl.build(:account).should be_valid
  end

  it { should belong_to(:user) }
  it { should belong_to(:account_type) }
  it { should have_many(:journals) }
end
