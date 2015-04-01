class CreateCoursesLocations < ActiveRecord::Migration
  def change
    create_table :courses_locations do |t|
			t.integer :course_id
			t.integer :location_id
    end
  end
end
