require 'spec_helper'

describe "accounts/index" do
  before(:each) do
    assign(:assets, [
      stub_model(Account,
        :user_id => 1,
        :name => "Name",
        :description => "Description"
      ),
      stub_model(Account,
        :user_id => 1,
        :name => "Name",
        :description => "Description"
      )
    ])

    assign(:liabilities, [
      stub_model(Account,
        :user_id => 1,
        :name => "Name",
        :description => "Description"
      ),
      stub_model(Account,
        :user_id => 1,
        :name => "Name",
        :description => "Description"
      )
    ])
  end

  it "renders a list of accounts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
