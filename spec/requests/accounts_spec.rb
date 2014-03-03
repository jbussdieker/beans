require 'spec_helper'

describe "Accounts" do
  before do
    @user = login(:user)
  end

  describe "GET /accounts" do
    it "displays heading", js: true do
      visit accounts_path
      page.should have_content("Accounts")
    end
  end

  describe "Creates accounts" do
    before do
      visit accounts_path
      page.should have_content("Accounts")
      click_link "New"
    end

    it "works", js: true do
      expect {
        fill_in "Name", with: "blah"
        fill_in "Description", with: "test"
        click_button "Create"
        page.should have_content("success")
      }.to change(Account, :count).by(1)
    end
  end

  describe "Edit Account" do
    before do
      @account = FactoryGirl.create(:account, user: @user)
      visit accounts_path
    end

    it "displays success flash", js: true do
      click_link "Edit"
      fill_in "Name", with: "foo"
      click_button "Update"
      page.should have_content("success")
    end
  end

  describe "Deletes accounts" do
    before do
      @account = FactoryGirl.create(:account, user: @user)
      visit accounts_path
    end

    it "works", js: true do
      expect {
        click_link "Destroy"
        alert = page.driver.browser.switch_to.alert
        alert.accept
      }.to change(Account, :count).by(-1)
    end
  end
end
