def input_students
  puts "Please enter the name of the students"
  puts "To finish, just hit return twice"
  
  #create an empty array
  students = []
  
  # get first name
  name = gets.chomp
  
  # while name is not empty repeat this code
  while !name.empty? do
     students << {name: name.capitalize, cohort: :november}
     puts "Now we have #{students.count} students."
     
     # get another name from the user
     name = gets.chomp
  end
  
  # return array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  idx = 0
  # Loops until the expression evaluates to true
  until idx == students.size 
    puts "#{students[idx][:name]} (#{students[idx][:cohort]} cohort)"
    
    idx += 1
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"    
end

students = input_students
# nothing happens until we call the below methods.
print_header
print(students)
print_footer(students)
