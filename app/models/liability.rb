class Liability < Account
  def balance
    balance = super
    (balance == 0 ? balance : -balance)
  end
end
