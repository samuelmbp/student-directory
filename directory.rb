@students = [] # An empty array accessible to all methods

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the students to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3" then save_students; puts "Students successfully saved."
    when "4" then load_students; puts "Students successfully loaded"
    when "9" then puts "See you later!"; exit 
    else puts "I don't know what you meant, try again."
  end
end

def student_name
  puts "Please enter the name of the students"
  puts "To finish, just hit return twice"
  name = STDIN.gets.chomp
end

def student_cohort(name)
  if !name.empty?
    puts "Please enter cohort for: #{name}"
    cohort = STDIN.gets.chomp
    # Default value if user does not enter a chort
    cohort = "February".to_sym if cohort.empty?
  end
end

def input_students
  # Get student name
  name = student_name
  cohort = student_cohort(name)
  # While the name is not empty, repeat this code
  while !name.empty? do
    add_student_to_list(name, cohort)
    puts "Now we have #{@students.count} #{@students.count == 1 ? "student" : "students."}"
    puts "Please enter another student name: "
    name = STDIN.gets.chomp
    # Get student cohort
    cohort = student_cohort(name)
  end
end

def add_student_to_list(name, cohort)
  # Add student hash to an array
  @students << { name: name, cohort: cohort }
end


def show_students
  print_header
  print_student_list
  print_footer
end

def print_header
    puts "The students of Villains Academy"
    puts "-------------------------------"
end

def print_student_list
  # Display the list if it has at least one student
    if @students.count >= 1
      # Add an index to each student
      @students.each.with_index(1) do |student, idx|
          puts "#{idx}. #{student[:name]} (#{student[:cohort]} cohort)"
      end
    else
      puts "The list is empty. Please enter at least one student."
    end
end

def print_footer
    puts "Overall, we have #{@students.count} great #{@students.count == 1 ? "student" : "students"}"    
end

def save_students
  # Open file for writing
  file = File.open("students.csv", "w")
  # Iterate over the array of students
  # @students.each { |student|  
  #   # Create a new array with student name and cohort
  #   student_data = [student[:name], student[:cohort]]
  #   csv_line = student_data.join(",")
  #   file.puts csv_line # Write to the file
  # }
  
  @students.each do |student| 
    # Create a new array with student name and cohort
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line # Write to the file
  end
  
  file.close
end


def load_students(filename = "students.csv") # Default value
  # Open file for reading
  file = File.open(filename, "r")
  file.readlines.each do |line|
    # Array with two element (parallel assignment)
    name, cohort = line.chomp.split(",")
    add_student_to_list(name, cohort)
  end
  file.close
end

def try_load_students
  filename = ARGV.first # First argument from the command line
  return if filename.nil? # Get out of the method if it isn't given
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry #{filename} doesn't exist."
    exit
  end
end


try_load_students
interactive_menu
