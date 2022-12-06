# Define variables
n = 0
i = 0
a=[]

# Set path
path = 'Day6/input.txt'
#path = 'Day6/test_4.txt'

# Open File
file = File.open(path)

# Read content of file
file_data = file.read

# Split the data (input was a string); process it sign by sign
file_data.split(//).each do |sign|
  puts sign.inspect
  # fill start array
  if n<4
    i=n
    a[i]=sign
  elsif n>=4
    a.shift
    a[3]=sign
  end
  puts a.inspect
  if a.length==4
    puts "a is no 4 long"
    if a.any?{|el|a.count(el)>1}==false
      puts "FOUND UNIQUE SEGMENT"
      puts n+1
      break
    end
  end
  n+=1
end