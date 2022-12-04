# Define variables
sumPrio = 0

priority_1 = ('a'..'z').map{|letter| [letter, 0] }.to_h
priority_2 = ('A'..'Z').map{|letter| [letter, 1] }.to_h

n = 1
('a'..'z').to_a.each do|letter|
  priority_1[letter]=n
  n=n+1
end

n = 27
('A'..'Z').to_a.each do|letter|
  priority_2[letter]=n
  n=n+1
end

priority = priority_1.merge(priority_2)

# puts priority

# Set path
path = 'Day3/input.txt'
#path = 'Day3/test.txt'

# Open File
file = File.open(path)

# Read content of file
file_data = file.read

file_data.split(/\n/).each do |line|
  # split the line in two groups with equal length
  first, second = line.chars.each_slice(line.length / 2).map(&:join)
  # iterate through the first group element by element
  first.split(//).each do |firstElement|
    # puts firstElement
    # check, if element is part of second group. If this is the case, abort the iteration
    if second.include?(firstElement) == true
      # print 'The identical element in both compartments is ', firstElement
      # puts ''
      # puts priority[firstElement]
      sumPrio = sumPrio + priority[firstElement]
      break
    end
  end
end
puts sumPrio