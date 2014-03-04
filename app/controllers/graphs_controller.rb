class GraphsController < ApplicationController
  before_filter :authenticate_user!

  # GET /graphs
  def index
    @accounts = current_user.accounts
    @list = {}
    @accounts.where(type: "Expense").each do |account|
      @list[account.name] = -account.balance
    end

  end
end
