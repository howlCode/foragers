class AddSizeToCourses < ActiveRecord::Migration[5.1]
  def change
    add_column :courses, :size, :integer
  end
end
