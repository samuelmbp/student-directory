def input_students
  # Create an empty array
  students = []

  puts "Please enter the name and the cohort of the student on the same line with a space between"
  puts "Press 'quit' if you made a mistake and re-enter student information"
  
  student = " "
  
  # While name is not empty repeat this code
  while !student.empty? do
    # Student information
    student = gets.chomp.split(" ")
    
    # Parallel assignment
    name, cohort = student
    
    # Check for empty value
    break if name == nil
    
    # Quit if user makes a typo
    break if name == "quit" || cohort == "quit"
    
    # Default value if name or cohort is empty  - converted to a symbol
    name = "Sam".to_sym if name == nil
    cohort = "February".to_sym if cohort == nil
    
    # Add student to students array | display 'student' or 'students' baseed on the size
    students << { name: name, cohort: cohort }
    puts "Now we have #{students.count} #{students.count == 1 ? "student" : "students."}"
  
    puts "Please enter another student. To finish - just hit return twice"
  end
    
    # Return array of students
    students
end

def print_header
    puts "The students of Villains Academy"
    puts "-------------"
end

def print(students)
    # Add an index starting from 1 to each student
    students.each.with_index(1) do |student, idx|
        puts "#{idx}. #{student[:name]} (#{student[:cohort]} cohort)"
    end
    # p students
end

def print_footer(students)
    puts "Overall, we have #{students.count} great #{students.count == 1 ? "student" : "students"}"    
end

students = input_students
# nothing happens until we call the below methods.
print_header
print(students)
print_footer(students)

