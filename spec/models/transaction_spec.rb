require 'spec_helper'

describe Transaction do
  it "has a valid factory" do
    FactoryGirl.build(:transaction).should be_valid
  end

  it { should have_many(:journals) }
end
