@students = [] # An empty array accessible to all methods



def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the students to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit" # 9 because we'll be adding more items
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end


def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      load_students
    when "9"
      exit # 'exit' will cause the program to terminate
    else
      puts "I don't know what you meant, try again."
  end
end 

def input_students
  puts "Please enter the name of the students"
  puts "To finish - just hit return twice"
  
  name = gets.chomp # Gets the first name
  
  # While the name is not empty, repeat this code
  while !name.empty? do
    # Add student hash to an array
    @students << { name: name.capitalize, cohort: :february }
    
    # Display 'student' or 'students' baseed on the size
    puts "Now we have #{@students.count} #{@students.count == 1 ? "student" : "students."}"
    
    name = gets.chomp # Gets another name from the user
  end
end


def save_students
  # Open file for writing
  file = File.open("students.csv", "w")
  
  # Iterate over the array of students
  @students.each do |student| 
    # Create a new array with student name and cohort
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line # Write to the file
  end
  
  file.close
end

def load_students
  # Open file for reading
  file = File.open("students.csv", "r")
  
  file.readlines.each do |line|
    # Array with two element (parallel assignment)
    name, cohort = line.chomp.split(",")
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
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

interactive_menu
