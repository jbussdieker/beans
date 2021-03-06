class AccountsController < ApplicationController
  before_action :set_account, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  # GET /accounts
  def index
    @accounts = current_user.accounts
  end

  # GET /accounts/1
  def show
  end

  # GET /accounts/new
  def new
    @account = current_user.accounts.new
  end

  # GET /accounts/1/edit
  def edit
  end

  # POST /accounts
  def create
    @account = current_user.accounts.new(account_params)

    if @account.save
      redirect_to account_path(@account), notice: 'Account was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /accounts/1
  def update
    if @account.update(account_params)
      redirect_to account_path(@account), notice: 'Account was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /accounts/1
  def destroy
    @account.destroy
    redirect_to accounts_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account
      @account = current_user.accounts.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def account_params
      params.require(:account).permit(:type, :name, :description)
    end
end
