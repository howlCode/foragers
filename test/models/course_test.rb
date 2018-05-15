require 'test_helper'

class CourseTest < ActiveSupport::TestCase

  def setup
    @course = courses(:one)
  end

  test 'valid course' do
    assert @course.valid?
  end

end