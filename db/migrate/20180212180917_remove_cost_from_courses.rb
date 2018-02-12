class RemoveCostFromCourses < ActiveRecord::Migration[5.1]
  def change
    remove_column :courses, :cost, :decimal
  end
end
