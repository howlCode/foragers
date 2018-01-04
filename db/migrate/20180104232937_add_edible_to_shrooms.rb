class AddEdibleToShrooms < ActiveRecord::Migration[5.1]
  def change
    add_column :shrooms, :edible, :string
  end
end
