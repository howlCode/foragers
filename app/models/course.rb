class Course < ApplicationRecord
  validates :title, :description, :date, :location, :size, presence: true
  validates :size, numericality: { only_integer: true }

  def seats_available
  	if self.participants != 0
    	return self.size - self.participants
    else
    	return self.size
    end
  end

end
