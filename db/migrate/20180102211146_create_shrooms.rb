class CreateShrooms < ActiveRecord::Migration[5.1]
  def change
    create_table :shrooms do |t|
      t.text :name
      t.text :genus
      t.text :description
      t.boolean :edible
      t.attachment :image

      t.timestamps
    end
  end
end
