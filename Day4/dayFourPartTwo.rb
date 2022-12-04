# Define empty array
overlapping = 0
containing = 0
width = 2
height = 2
pair = Array.new(height){Array.new(width)}

# Set path
path = 'Day4/input.txt'
#path = 'Day4/test.txt'

# Open File
file = File.open(path)

# Read content of file
file_data = file.read

# Split the data (input was a string); process ist for each line
file_data.split(/\n/).each do |line|
  #puts 'SECTION'
  i = 0
  line.split(/,/).each do |part|
    j = 0
    #puts part
    part.split(/-/).each do |item|
      #puts i,j,item
      pair[i][j] = item.to_i
      j += 1
    end
    i += 1
  end

  # pair 0 0 = start elve 1
  # pair 0 1 = end elve 1
  # pair 1 0 = start elve 2
  # pair 1 1 = end elve 2

  puts pair.inspect

  if ((pair[0][0] <= pair[1][0]) && (pair[0][1] >= pair[1][1])) || ((pair[1][0] <= pair[0][0]) && (pair[1][1] >= pair[0][1]))
    containing += 1
    puts 'Contain'
  end

  if pair[0][0] <= pair[1][0] && pair[0][1] >= pair[1][0]
    overlapping += 1
    puts 'Overlap'
  elsif pair[1][0] <= pair[0][0] && pair[1][1] >= pair[0][0]
    overlapping += 1
    puts 'Overlap'
  end





end

print 'Containing: ', containing
puts
print 'Overlapping: ', overlapping
