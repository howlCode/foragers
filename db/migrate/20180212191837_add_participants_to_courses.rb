class AddParticipantsToCourses < ActiveRecord::Migration[5.1]
  def change
    add_column :courses, :participants, :integer, default: 0
  end
end
