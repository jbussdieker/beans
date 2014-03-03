require 'spec_helper'

describe "Transactions" do
  before do
    @user = login(:user)
  end

  describe "GET /transactions" do
    it "displays heading", js: true do
      visit transactions_path
      page.should have_content("Transactions")
    end
  end
end
