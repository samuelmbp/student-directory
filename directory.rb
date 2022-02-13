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
    students << { name: name, cohort: cohort.to_sym }
    puts "Now we have #{students.count} #{students.count == 1 ? "student" : "students."}"
  
    puts "Please enter another student. To finish - just hit return twice"
  end
    
    # Return array of students
    students
end

# Print the students grouped by a specific cohort.
def grouped_by_cohort(students)
  puts "Please enter the month of the cohort you would like to see: "
  cohort_to_print = gets.chomp.to_sym

  puts "Students from #{cohort_to_print} cohort: "
  students.map { |student| puts "#{student[:name]}" if student[:cohort] == cohort_to_print }
end

def print_header
    puts "The students of Villains Academy"
    puts "-------------------------------"
end

def print(students)
    # Add an index starting from 1 to each student
    students.each.with_index(1) do |student, idx|
        puts "#{idx}. #{student[:name]} (#{student[:cohort]} cohort)"
    end
end

def print_footer(students)
    puts "Overall, we have #{students.count} great #{students.count == 1 ? "student" : "students"}"    
end

students = input_students
# Nothing happens until we call the below methods.
print_header
# grouped_by_cohort(students)
print(students)
print_footer(students)

