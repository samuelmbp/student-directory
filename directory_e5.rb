
def input_students
  puts "Please enter: name, country of birth, height, hobby and cohort separated by a space."
  puts "To finish, just hit return twice"
  # Create an empty array
  students = []
  
  # Get details from user
  student_information = gets.chomp.split(" ")

  # While name is not empty repeat this code
  while !student_information.empty? do
    # Add student_information hash to students array
    students << {
      name: student_information[0], 
      country: student_information[1],
      height: student_information[2],
      hobby: student_information[3],
      cohort: :november
    } 
    puts "Now we have #{students.count} students."
    
     # Get more details from the user
    student_information = gets.chomp.split(" ")
  end
  
  # return array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
  puts "NAME COUNTRY HEIGHT HOBBY COHORT"
end

def print(students)
  students.each do |student|
      puts "#{student[:name]} #{student[:country]} #{student[:height]} #{student[:hobby]} #{student[:cohort]}"
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"    
end

students = input_students
# Nothing happens until we call the below methods.
print_header
print(students)
print_footer(students)
