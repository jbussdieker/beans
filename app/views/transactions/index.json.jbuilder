json.array!(@transactions) do |transaction|
  json.extract! transaction, :id, :date, :memo
  json.url transaction_url(transaction, format: :json)
end
