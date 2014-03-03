class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.integer :user_id
      t.integer :account_type_id
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
