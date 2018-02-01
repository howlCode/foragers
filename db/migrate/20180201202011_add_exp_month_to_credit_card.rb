class AddExpMonthToCreditCard < ActiveRecord::Migration[5.1]
  def change
    add_column :credit_cards, :exp_month, :integer
    add_column :credit_cards, :exp_year, :integer
  end
end
