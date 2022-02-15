File.open(File.basename("directory.rb"), "r") do |file|
  file.readlines.each { |line|
    puts line
  }
  end