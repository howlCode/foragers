class AddToCourses < ActiveRecord::Migration[5.1]
  def change
  	add_column :courses, :location, :string
  	add_column :courses, :date, :string
  end
end
