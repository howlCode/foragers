class Course < ApplicationRecord
  validates :title, :description, :date, :location, :size, presence: true
  validates :size, numericality: { only_integer: true }

  def seats_available
  	if self.participants != 0
    	self.size - self.participants
    else
    	self.size
    end
  end

  def class_time
  	if self.date < DateTime.now
      self.participants = self.size
  		self.date = "COURSE OVER"
  	else
  		self.date.strftime("%m/%d/%y at %l:%M %p")
  	end
  end

end
