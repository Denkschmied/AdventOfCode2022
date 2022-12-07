# Define variables
fileRegister = Hash.new(0)
fileStructure = []
sum = 0
n=0
possibleDirectory=[]

# Set path
path = 'Day7/input.txt'
#path = 'Day7/test.txt'

# Open File
file = File.open(path)

# Read content of file
file_data = file.read

file_data.split(/\n/).each do |line|
  puts '--------------START--------------'
  puts line
  case
  when line.include?('$ cd ..')
    puts 'Get one level up'
    fileStructure.pop
  when line.include?('$ cd')
    puts 'Open folder'
    fileStructure.push [fileStructure.last,(line.split(' ').last)].compact.join(' ')
  when line.include?('dir')
    puts 'This is a directory'
  when line.include?('$ ls')
    puts 'List the content of the current folder'
  else
    puts 'This is a file'
    fileStructure.each {|i| fileRegister[i] += line.split(' ').first.to_i}
  end
  #puts fileStructure.inspect
  #puts fileRegister.inspect
end

puts '--------------END--------------'

fileRegister.each do |key,value|
  if value < 100000
    sum += value
  end
end

puts "The sum of all folders with a size of at least 100000 is #{sum}"

fileRegister.each do |key,value|
  if value > (fileRegister['/'] - 40000000)
    possibleDirectory[n]=value
    n += 1
  end
end

puts "The diretory with the smallest size to free up the required space has the size of #{possibleDirectory.min}"
