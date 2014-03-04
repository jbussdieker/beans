class Transaction < ActiveRecord::Base
  has_many :journals, dependent: :delete_all

  accepts_nested_attributes_for :journals, :allow_destroy => true
  validates :date, presence: true

end
