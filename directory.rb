# Students array
students = [
    "Dr. Hannibal Lecter",
    "Darth Vader",
    "Nurse Ratched",
    "Michael Corleone",
    "Alex DeLarge",
    "The Wicked Witch of the West",
    "Terminator",
    "Freddy Krueger",
    "The Joker",
    "Joffrey Baratheon",
    "Norman Bates"
]
# Print the students
puts "The students of Villains Academy"
puts "-------------"

students.each do |student|
    puts student
end
# Print the total
puts "Overall, we have #{students.count} great students"
