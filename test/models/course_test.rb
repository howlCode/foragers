require 'test_helper'

class CourseTest < ActiveSupport::TestCase

  def setup
    @course = Course.new(title: 'test', description: 'test', location: 'test',
    										 size: 1, date: DateTime.new(2018, 1, 1, 1, 0))
  end

  test 'valid course' do
    assert @course.valid?
  end

end