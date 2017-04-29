file = File.open(File.basename(__FILE__), 'r') do |file|
  file.readlines.each do |line|
    puts line
  end
end
