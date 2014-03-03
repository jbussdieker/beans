class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :user_id
      t.date :date
      t.string :memo

      t.timestamps
    end
  end
end
