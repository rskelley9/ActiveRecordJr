require_relative 'database_model.rb'

class Cohort < Database::Model
  def self.table_name
    "cohorts"
  end

  self.attribute_names =  [:id, :first_name, :last_name, :created_at, :updated_at]

  def students
    Student.where('cohort_id = ?', self[:id])
  end

  def add_students(students)
    students.each do |student|
      student.cohort = self
    end

    students
  end
end
