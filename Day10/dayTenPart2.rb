
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
path = 'Day10/input.txt'
#path = 'Day10/test.txt'

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

cycle = 1
posSprite = 1
i = 0
posX = []
x = 1

for n in 0..vecDelta.length-1 do
  x += vecDelta[n]
  posX.push(x)
end

puts posX.inspect
(0..5).each { |row|
  # write row
  #print "start cycle #{cycle}"
    (0..39).each { |n|
      case n
      when posSprite-1..posSprite+1
        print "#"
      else
        print "."
      end
      posSprite = posX[cycle-1]
      cycle += 1
    }
  #print "end cycle #{cycle - 1}\n"
  print"\n"
}





