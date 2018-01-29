class CreateCreditCards < ActiveRecord::Migration[5.1]
  def change
    create_table :credit_cards do |t|
      t.string :name, null: false
      t.string :brand, null: false
      t.integer :account, null: false
      t.integer :expiration, null: false
      t.integer :cvc, null: false

      t.timestamps
    end
  end
end
