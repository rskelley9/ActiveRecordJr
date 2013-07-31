require_relative 'app.rb'

# p Student.all
p Student.all.first

student = Student.all.first

p student[:first_name] == "Gail"

p Student.where("first_name = ?", "Gail").length == 2
