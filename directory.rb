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
    
    # Add student hash to students array 
    students << { name: name.capitalize, cohort: cohort.to_sym }
    
    # Display 'student' or 'students' baseed on the size
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

def interactive_menu
  students = []
  loop do
    # 1. print the menu and ask the user what to do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"
    # 2. read the input and save it into a variable
    selection = gets.chomp
    # 3. do what the user has asked
    case selection
    when "1"
      students = input_students
    when "2"
      print_header
      print(students)
      print_footer(students)
    when "9"
      exit # cause the program to terminate
    else
      puts "I don't know what you meant, try again."
    end
  end
end

def print(students)
  # Display list if it has at least one student
    if students.count >= 1
      # Add an index starting from 1 to each student
      students.each.with_index(1) do |student, idx|
          puts "#{idx}. #{student[:name]} (#{student[:cohort]} cohort)"
      end
    else
      puts "The list is empty. Please enter at least one student."
    end
end

def print_footer(students)
    puts "Overall, we have #{students.count} great #{students.count == 1 ? "student" : "students"}"    
end

interactive_menu

# students = input_students
# Nothing happens until we call the below methods.
# print_header
# grouped_by_cohort(students)
# print(students)
# print_footer(students)

