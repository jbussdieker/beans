class ReportsController < ApplicationController
  before_filter :authenticate_user!

  def balance_sheet
    @assets = current_user.accounts.where(type: "Asset")
    @liabilities = current_user.accounts.where(type: "Liability")
  end
end
