class CreateJournals < ActiveRecord::Migration
  def change
    create_table :journals do |t|
      t.integer :account_id
      t.decimal :amount, :precision => 8, :scale => 2

      t.timestamps
    end
  end
end
