class AddCreditCardIdToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :credit_card_id, :integer
  end
end
