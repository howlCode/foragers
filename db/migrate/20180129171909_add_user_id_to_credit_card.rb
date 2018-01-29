class AddUserIdToCreditCard < ActiveRecord::Migration[5.1]
  def change
    add_column :credit_cards, :user_id, :integer
  end
end
