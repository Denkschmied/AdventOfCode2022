# Define variables
sumPrio = 0
groupArray = Array.new(3)

priority_1 = ('a'..'z').map{|letter| [letter, 0] }.to_h
priority_2 = ('A'..'Z').map{|letter| [letter, 0] }.to_h

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

i = 0

file_data.split(/\n/).each do |line|
  groupArray[i]=line
  i += 1
  if i==3
    i = 0
    groupArray[0].split(//).each do |firstElement|
      if groupArray[1].include?(firstElement) == true
        if groupArray[2].include?(firstElement)==true
          # puts firstElement
          sumPrio = sumPrio + priority[firstElement]
          break
        end
      end
    end
  end
end
puts sumPrio