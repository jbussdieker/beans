class TransfersController < ApplicationController
  before_action :set_transfer, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  # GET /transfers/1
  def show
  end

  # GET /transfers/new
  def new
    @transfer = Transfer.new(user_id: current_user.id)
    @transfer.journals.new
    @transfer.journals.new
  end

  # GET /transfers/1/edit
  def edit
  end

  # POST /transfers
  def create
    @transfer = current_user.transfers.new(transfer_params)

    if @transfer.save
      redirect_to @transfer, notice: 'Transaction was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /transfers/1
  def update
    if @transfer.update(transfer_params)
      redirect_to @transfer, notice: 'Transaction was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /transfers/1
  def destroy
    @transfer.destroy
    redirect_to transfers_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transfer
      @transfer = current_user.transactions.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transfer_params
      params.require(:transfer).permit(:payee, :date, :memo, :amount, :from_account_id, :to_account_id)
    end
end
