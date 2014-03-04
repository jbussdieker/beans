class Transfer < Transaction
  def from_account_id
    journals.second.account_id
  end

  def from_account_id=(value)
    journals.second.account_id = value
  end

  def to_account_id
    journals.first.account_id
  end

  def to_account_id=(value)
    journals.first.account_id = value
  end

  def amount
    journals.second.amount
  end

  def amount=(value)
    journals.first.update(amount: -(value.to_f))
    journals.second.update(amount: value.to_f)
  end
end
