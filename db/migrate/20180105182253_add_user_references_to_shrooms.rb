class AddUserReferencesToShrooms < ActiveRecord::Migration[5.1]
  def change
    add_reference :shrooms, :user, foreign_key: true
  end
end
