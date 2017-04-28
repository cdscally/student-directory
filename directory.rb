
def input_students

  students = []
  @months = [:January, :February, :March, :April, :May,:June,:July,:August,:Septmber,:October,:November,:December]

  puts "Please enter the name of the students"
  puts "To finish, just hit return twice"
  name = gets.chomp
  puts "To what cohort does the student belong?"
  cohort = gets.chomp.capitalize.to_sym

  while !name.empty? do

    until @months.include? cohort
      puts "Please enter a valid month"
      cohort = gets.chomp.capitalize.to_sym
    end

    students << {name: name, cohort: cohort}
    len = students.length

    if len == 1
      @l = "student"
    else
      @l = "students"
    end

    if students[len-1][:cohort] == ''
      students[len-1][:cohort] = 'undefined'
    end

    puts "Now we have #{students.count} #{@l}"
    puts "Enter the name of the next student"
    name = gets.chomp
    if !name.empty?
      puts "...and their cohort?"
      cohort = gets.chomp.capitalize.to_sym
    end

  end

  students

end

def print_header
  puts "The students of Villains Academy".center(100,'-')
  puts "--------------------------------".center(100,'-')
end


def print(students)
=begin
  puts "Method 1 Output"
  puts students_by_cohort = students.group_by{|student| student[:cohort]}
  puts "  "
  puts "Method 2 Output"
=end

  output = []
  students.each do |hsh|
    @months.each do |month|
      if hsh[:cohort] == month
        output << "#{month} cohort - #{hsh[:name]}"
      end
    end
  end

  @months.each do |month|
    output.each do |str|
      if str.include? month.to_s
        puts str.center(100,'|')
      end
    end
  end

end

def print_footer(students)
  puts "Overall we have #{students.count} great #{@l}".center(100, '-')
end


def interactive_menu
  #print the menu asking the user what to do
  students = []
  loop do
    puts "Student Directory - enter the number of the desired choice below"
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"
  # read the input and save to a variable
  selection = gets.chomp
    case selection
      when "1"
        #input the students
        students = input_students
      when "2"
        #show the students
        if students.length == 0
          puts "No student records entered"
        else
          print_header
          print(students)
          print_footer(students)
        end
      when "9"
        exit
      else
        puts "Invalid selection, please try again"
    end
  end
end

interactive_menu
