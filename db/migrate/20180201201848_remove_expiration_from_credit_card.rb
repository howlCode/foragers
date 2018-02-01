class RemoveExpirationFromCreditCard < ActiveRecord::Migration[5.1]
  def change
    remove_column :credit_cards, :expiration, :integer
  end
end
