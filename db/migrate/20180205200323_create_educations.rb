class CreateEducations < ActiveRecord::Migration[5.1]
  def change
    create_table :educations do |t|
      t.string :title
      t.text :description
      t.string :date
      t.integer :size

      t.timestamps
    end
  end
end
