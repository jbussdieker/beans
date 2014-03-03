class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :user_id
      t.datetime :date
      t.string :memo

      t.timestamps
    end
  end
end
