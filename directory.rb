
def input_students
  puts "Please enter the name of the students"
  puts "To finish, just hit return twice"

  students = []

  name = gets.chomp
  puts "What nationality?"
  nationality = gets.chomp

  while !name.empty? do
    students << {name: name, cohort: :november, nationality: nationality}
    puts "Now we have #{students.count} students"
    puts "Next name?"
    name = gets.chomp
    if !name.empty?
      puts "...and their nationality?"
      nationality = gets.chomp
    end
  end

  students

end

def print_header
  puts "The students of Villains Academy"
  puts "--------------------------------"
end


def print(students)
  i = 0
  while i < students.length
    puts "#{students[i][:name]}, #{students[i][:nationality]} (#{students[i][:cohort]} cohort)"
    i += 1
  end
end

def print_footer(students)
  puts "Overall we have #{students.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)
