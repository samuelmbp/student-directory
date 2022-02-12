def input_students
  # Create an empty array
  students = []

  puts "Please enter the name and the cohort of the student on the same line with a space between"
  
  student = " "
  
  # While name is not empty repeat this code
  while !student.empty? do
    student = gets.chomp.split(" ")
    
    # Parallel assignment
    name, cohort = student
    
    name = "Sam".to_sym if name == nil
    cohort = "February".to_sym if cohort == nil
    
    # Default values for name and cohort
    # name = "Sam".to_sym if name.empty?

    
    # Add student_information hash to students array
    students << {
     name: name, 
     cohort: cohort
    }
     
    puts "Now we have #{students.count} students."
   
    puts "Please enter another student. To finish - just hit return twice"
     
  #   # Get another name from the user
  #   name = gets.chomp
  #   # Ask for another cohort
  #   cohort = gets.chomp
  end
    
    # Return array of students
    students
end

def print_header
    puts "The students of Villains Academy"
    puts "-------------"
end

def print(students)
    students.each do |student|
        puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
    p students
end

def print_footer(students)
    puts "Overall, we have #{students.count} great students"    
end

students = input_students
# nothing happens until we call the below methods.
print_header
print(students)
print_footer(students)

