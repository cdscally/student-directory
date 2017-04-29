require 'csv'
@students = [] # an empty array accessible to all methods

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  name = STDIN.gets.chomp # get the first name
  while !name.empty? do  # while the name is not empty, repeat this code
    add_to_students(name) # add the student hash to the array
    puts "Now we have #{@students.count} students"
    name = STDIN.gets.chomp # get another name from the user
  end
end

def add_to_students(name)
  @students << {name: name, cohort: :november}
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to a file"
  puts "4. Load the list from a file"
  puts "9. Exit" # 9 because we'll be adding more items
end

def show_students
  print_header
  print_student_list
  print_footer
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    puts "Enter the name of the file"
    file_name = gets.chomp
    save_students(file_name)
  when "4"
    puts "Enter the name of the file"
    file_name = gets.chomp
    load_students(file_name)
  when "9"
    exit # this will cause the program to terminate
  else
    puts "I don't know what you meant, try again"
  end
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_student_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def save_students(file_name)
  CSV.open(file_name,"w") do |csv|
    @students.each do |student|
      csv << [student[:name], student[:cohort]]
      puts "adding #{student[:name]} to the csv file"
    end
  end
=begin
  file = File.open(file_name, "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
    puts "Adding #{student_data[0]} to the csv file"
  end
=end
end

def load_students(file_name = "students.csv")
  if File.exists? (file_name)
    CSV.foreach(file_name) do |row|
      name, cohort = row[0], row[1]
      add_to_students(name)
    end
    puts "Added student records from #{file_name}"

=begin
    file = File.open(file_name, "r") do |file|
      file.readlines.each do |line|
        name, cohort = line.chomp.split(",")
        add_to_students(name)
      end
      puts "Added student records from #{file_name}"
    end
=end

  else
    puts "Sorry, that file does not exist"
    return
  end
end

def try_load_students
  filename = ARGV.first
  if filename.nil?
    load_students("students.csv")
  elsif File.exists? (filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} oesn't exist"
  end
end

try_load_students
interactive_menu
