class AddStatusToOrder < ActiveRecord::Migration[5.1]
  def change
    change_column :orders, :status, :string, default: 'unsubmitted'
  end
end
