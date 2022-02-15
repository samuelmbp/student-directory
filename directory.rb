@students = [] # An empty array accessible to all methods

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the students"
  puts "4. Load the list"
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
    when "3" then add_file_name; puts "Students successfully saved."
    when "4" then load_students(load_filename); puts "Students successfully loaded"
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
  end
end

def input_students
  # Get student name
  name = student_name
  cohort = student_cohort(name)
  while !name.empty? do
    add_student_to_list(name, cohort)
    puts "Now we have #{@students.count} #{@students.count == 1 ? "student" : "students."}"
    
    name = STDIN.gets.chomp
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
  @students.each.with_index(1) { |student, idx| puts "#{idx}. #{student[:name]} (#{student[:cohort]} cohort)" }
end

def print_footer
    puts "Overall, we have #{@students.count} great #{@students.count == 1 ? "student" : "students"}"    
end

def add_file_name
  puts "Enter the filename you want the students to be saved"
  filename = STDIN.gets.chomp
  if filename != nil
    file = File.open(filename, "w")
    save_students(file)
  else
    file = File.open("students.csv", "w")
    save_students(file)
  end
  file.close
end

def save_students(file)
  @students.each do |student| 
    # Create a new array with student name and cohort
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line # Write to the file
  end
end

def load_filename
  puts "Please enter the filename from which you wish to load the students"
  filename = STDIN.gets.chomp
  loop do
    if File.exists?(filename)
      return filename
    else
      puts "Sorry, the entered filename #{filename} does not exist"
      filename = STDIN.gets.chomp
    end
  end
end

def load_students(load_filename = "students.csv")
# Open file for reading
  file = File.open("#{load_filename}", "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(",")
    add_student_to_list(name, cohort)
  end
  file.close
end

def try_load_students
  filename = ARGV.first # First argument from the command line
  if filename.nil?
    filename = "students.csv"
  end
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
