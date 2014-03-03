class Transaction < ActiveRecord::Base
  has_many :journals

  accepts_nested_attributes_for :journals, :allow_destroy => true
end
