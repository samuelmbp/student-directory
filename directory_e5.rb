def input_students
  puts "Please enter: name, country of birth, height, hobby and cohort separated by a space."
  puts "To finish, just hit return twice"
  
  # Create an empty array
  students = []
  
  # To be overriden
  student_information = " "
  
  # While name is not empty repeat this code
  while !student_information.empty? do
    # Get more details from the user
    student_information = gets.chomp.split(" ")
    p student_information
    # Parallel assignment
    name, country, height, hobby, cohort = student_information
    
    
    # Check for empty value
    break if name == nil
    
    # Assign unknown if any of the values are empty
    country = "Unknown" if country == nil
    height = "Unknown" if height == nil
    hobby = "Unknown" if hobby == nil
    cohort = "Unknown" if cohort == nil

   # Add student_information hash to students array
    students << {
      name: name,
      country: country,
      height: height,
      hobby: hobby,
      cohort: cohort
    }
    puts "Now we have #{students.count} students."
  end
  
  # Return array of students
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
  p students
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"    
end

students = input_students
# Nothing happens until we call the below methods.
print_header
print(students)
print_footer(students)
