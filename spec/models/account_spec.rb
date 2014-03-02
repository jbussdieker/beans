require 'spec_helper'

describe Account do
  it "has a valid factory" do
    FactoryGirl.build(:account).should be_valid
  end
end
