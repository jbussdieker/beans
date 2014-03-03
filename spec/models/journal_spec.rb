require 'spec_helper'

describe Journal do
  it "has a valid factory" do
    FactoryGirl.build(:journal).should be_valid
  end

  it { should belong_to(:account) }
end
