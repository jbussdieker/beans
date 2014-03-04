class Transaction < ActiveRecord::Base
  has_many :journals, dependent: :delete_all

  accepts_nested_attributes_for :journals, :allow_destroy => true
  validates :date, presence: true
  validate :double_entry

  def double_entry
    total = 0
    journals.each do |journal|
      total += journal.amount
    end
    errors.add(:base, "asdf") if total != 0
  end

  def amount
    journals.first.amount
  end
end
