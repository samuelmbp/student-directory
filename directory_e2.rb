
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
    # Print the index of each name starting from 1.
    students.each.with_index(1) do |student, idx|
        # Print name if starts with a given char or chars
      if student[:name].start_with?("S")
        puts "#{idx}. #{student[:name]} (#{student[:cohort]} cohort)"
      end
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
