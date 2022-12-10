
# Function for data input
def importFile(pathToFile)
  # Open File
  file = File.open(pathToFile)
  # Read content of file
  file = file.read
  return file
end


#-----------------MAIN-----------------
# define variables
x = 1
vecDelta = []

# Set path
#path = 'Day10/input.txt'
path = 'Day10/test.txt'

# Open and read content of file
file_data = importFile(path)

file_data.split(/\n/).each do |line|
  comm,delta = line.split(/ /)
  # generate vector with deltas
  if comm == 'noop'
    vecDelta.push(0)
    puts "Comm is Noop - do nothing"
  elsif comm == 'addx'
    puts "Comm is Comm and delta is #{delta}"
    vecDelta.push(0)
    vecDelta.push(delta.to_i)
  end
end

puts vecDelta.inspect

# calculate sum
for n in 0..vecDelta.length-1 do
  puts "-----THIS IS SEQUENC #{n+1}------"
  x += vecDelta[n]
  if n == 19
    x_20 = x*20
  elsif n == 59
    x_60 = x*60
  elsif n == 99
    x_100 = x*100
  elsif n == 139
    x_140 = x*140
  elsif n == 179
    x_180 = x*180
  elsif n == 219
    x_220 = x*220
  end
  puts "x is #{x} and delta is #{vecDelta[n]}"
end

puts x_20
puts x_60
puts x_100
puts x_140
puts x_180
puts x_220
puts x_20+x_60+x_100+x_140+x_180+x_220