def readfile
  if ARGV.size < 1
    puts "Please supply filename"
    exit 42
  end
  filename = ARGV.shift
  temps = []
  File.open(filename).each_with_index do |line, index|
    if(index > 7 && index < 39)
      max = line[6..9].delete('*').strip
      min = line[12..15].delete('*').strip
      temps << max.to_i - min.to_i
    end
  end
  temps.sort.first
end

puts readfile