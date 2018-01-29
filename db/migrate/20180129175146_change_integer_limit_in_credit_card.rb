class ChangeIntegerLimitInCreditCard < ActiveRecord::Migration[5.1]
  def change
  	change_column :credit_cards, :account, :integer, limit: 8
  end
end
