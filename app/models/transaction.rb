class Transaction < ActiveRecord::Base
  has_many :journals
end
