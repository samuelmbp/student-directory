def input_students
    # Create an empty array
    students = []
    
    puts "To finish, just hit return twice"
    puts "Enter the name of the student"
    # Get first name
    name = gets.chomp
    
    puts "Enter the cohort"
    # Get the cohort the user belongs to
    cohort = gets.chomp
    
    # While name is not empty repeat this code
    while !name.empty? do
       students << {name: name, cohort: cohort}
       puts "Now we have #{students.count} students."
       
       # Get another name from the user
       name = gets.chomp
       # Ask for another cohort
       cohort = gets.chomp
    end
    
    # return array of students
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
end

def print_footer(students)
    puts "Overall, we have #{students.count} great students"    
end

students = input_students
# nothing happens until we call the below methods.
print_header
print(students)
print_footer(students)

