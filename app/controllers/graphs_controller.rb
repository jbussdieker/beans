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

  def income
    @accounts = current_user.accounts
    @list = {}
    @accounts.where(type: "Income").each do |account|
      @list[account.name] = account.balance
    end
  end

  def expense
    @accounts = current_user.accounts
    @list = {}
    @accounts.where(type: "Expense").each do |account|
      @list[account.name] = -account.balance
    end
  end

  def assets
    @accounts = current_user.accounts
    @list = {}
    @accounts.where(type: "Asset").each do |account|
      if account.balance > 0
        @list[account.name] = account.balance
      end
    end
  end

  def equity
    @accounts = current_user.accounts
    @list = {}
    @accounts.where(type: "Equity").each do |account|
      @list[account.name] = account.balance
    end
  end
end
