class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :user_id
      t.string :payee
      t.date :date
      t.string :memo
      t.decimal :amount, :precision => 8, :scale => 2

      t.timestamps
    end
  end
end
