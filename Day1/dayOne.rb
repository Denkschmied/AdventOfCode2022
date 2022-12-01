# Define empty array
b = []

# Set path
path = 'Day1/input.txt'
# path = 'Day1/test.txt'

# Open File
file = File.open(path)

# Read content of file
file_data = file.read

# Split the data (input was a string); process ist for each line
file_data.split(/\n{2,}/).each do |line|
  # Each single line is split based on the delimiter \n; conversion to integer; calculation of sum
  b << line.split(/\n/).map(&:to_i).sum
end

# Select the maximum values (in this case the 3 maximum values); calculate the sum of the maximum values
puts b.max(3).sum
