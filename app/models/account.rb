class Account < ActiveRecord::Base
  TYPES = ["Asset", "Liability", "Income", "Expense", "Equity"]

  belongs_to :user
  belongs_to :account_type
  has_many :journals

  validates :type, presence: true
  validates :name, presence: true
  validates_inclusion_of :type, :in => TYPES

  def to_s
    name
  end

  def multiplier
    1
  end

  def balance
    journals.sum(:amount) * multiplier
  end

  def transactions
    journals.collect {|j| [j.transaction, j.amount]}
  end
end
