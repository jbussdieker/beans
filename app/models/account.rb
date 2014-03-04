class Account < ActiveRecord::Base
  belongs_to :user
  belongs_to :account_type
  has_many :journals

  scope :assets, -> { where(:account_type_id => 1) }
  scope :liabilities, -> { where(:account_type_id => 2) }
  scope :equity, -> { where(:account_type_id => 3) }
  scope :income, -> { where(:account_type_id => 4) }
  scope :expense, -> { where(:account_type_id => 5) }

  def to_s
    name
  end

  def transactions
    journals.collect {|j| [j.transaction, j.amount]}
  end
end
