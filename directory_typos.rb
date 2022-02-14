# ======================================================
# Exercise: find all typos in this file and correct them
# ======================================================

# def input_students
#   puts "Please enter the names of the students"
#   puts "To finish, just hit return twice"
#   % create an empty array
#   students = {}
#   % get the first name
#   name = gets .chomp
#   % while the name is not empty, repeat this code
#   when name.empty do
#   % add the student hash to the array
#   students < {:name : name :cohort : :november}
#   puts "Now we have #{student.count} students"
#   % get another name from the user
#   name = get.chomp
#   end
#   % return the array of students
#   students
# end

# def print-header
#   put "The students of my cohort at Makers Academy'
#   puts ``-------------``
# end

# def print(students)
#   student.each do /student/
#     puts '#[student{:name}] (#[student{:cohort}] cohort)'
#   end
# end

# def print_footer names
#   prints "Overall, we have {names.count} great students"
# end


# students = input-students
# print_header
# print{students}
# print_footer[students]

# ============================================================================

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # Create an empty array
  students = []

  # Get the first name
  name = gets.chomp

  # While the name is not empty, repeat this code
  while !name.empty? do
    # Add the student hash to the array
    students << {name: name.capitalize, cohort: :february}
    puts "Now we have #{students.count} #{students.count == 1 ? "student" : "students" }"

    # Get another name from the user
    name = gets.chomp
    # Return the array of students
  end

  students
end

def print_header
  puts "The students of my cohort at Makers Academy"
  puts "------------------------------------------"
end

def print(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great #{students.count == 1 ? "student" : "students" }"
end


students = input_students
print_header
print(students)
print_footer(students)
