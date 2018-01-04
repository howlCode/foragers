class RemoveEdibleFromShrooms < ActiveRecord::Migration[5.1]
  def change
    remove_column :shrooms, :edible, :boolean
  end
end
