require_relative 'database_model.rb'

class Student < Database::Model
  def self.table_name
    "students"
  end

  self.attribute_names =  [:id, :cohort_id, :first_name, :last_name, :email,
                           :gender, :birthdate, :created_at, :updated_at] 

  # We say a record is "new" if it doesn't have a defined primary key in its
  # attributes


  # e.g., student['first_name'] #=> 'Steve'
  #[]

  def cohort
    Cohort.where('id = ?', self[:cohort_id]).first
  end

  def cohort=(cohort)
    self[:cohort_id] = cohort[:id]
    self.save
    cohort
  end
end
