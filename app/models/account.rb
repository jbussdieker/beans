class Account < ActiveRecord::Base
  belongs_to :user
  belongs_to :account_type
  has_many :journals

  def to_s
    name
  end

  def balance
    journals.sum(:amount)
  end

  def transactions
    journals.collect {|j| [j.transaction, j.amount]}
  end
end
