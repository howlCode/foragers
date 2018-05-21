class ChangeCoursesDateToDatetime < ActiveRecord::Migration[5.1]
  def up
  	remove_column :courses, :date
  	add_column :courses, :date, :datetime
  end
end
