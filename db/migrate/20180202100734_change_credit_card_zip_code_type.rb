class ChangeCreditCardZipCodeType < ActiveRecord::Migration[5.1]
  def change
    change_column :credit_cards, :account, :string
    change_column :credit_cards, :exp_month, :string
    change_column :credit_cards, :exp_year, :string
    change_column :credit_cards, :cvc, :string
  end
end
