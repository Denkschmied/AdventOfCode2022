def importFile(pathToFile)
  # Open File
  file = File.open(pathToFile)
  # Read content of file
  file = file.read
  return file
end

#function for tail movement
def tailMove(head, tail, number)
  #-----TAIL MOVEMENT-----
  # left or right in line
  if (head[0] - tail[0] > 1) && (head[1] == tail[1])
    tail[0] += 1
  elsif (head[0] - tail[0] < -1) && (head[1] == tail[1])
    tail[0] -= 1
  end
  # up or down in line
  if (head[1] - tail[1] > 1) && (head[0] == tail[0])
    tail[1] += 1
  elsif (head[1] - tail[1] < -1) && (head[0] == tail[0])
    tail[1] -= 1
  end
  # diagonal
  # calculate differences between tail and head
  # head - tail
  deltaX = head[0] - tail[0]
  deltaY = head[1] - tail[1]

  if ((deltaX.abs == 1) && (deltaY.abs == 2)) || ((deltaX.abs == 2) && (deltaY.abs == 1))
    tail[0] += deltaX / deltaX.abs
    tail[1] += deltaY / deltaY.abs
  elsif ((deltaX.abs == 2) && (deltaY.abs == 2)) || ((deltaX.abs == 2) && (deltaY.abs == 2))
    tail[0] += deltaX / deltaX.abs
    tail[1] += deltaY / deltaY.abs
  end
  puts "Movement of tail #{number} to #{tail}"
  return tail
end

#---------------MAIN---------------
# define variables
comm = []
visitedFields = Array.new
steps = 0

# Set path
path = 'Day9/input.txt'
#path = 'Day9/test_1.txt'

# Open and read content of file
file_data = importFile(path)

# extract changes of head vector
file_data.split(/\n/).each do |line|
  dir,steps = line.split(/ /)
  comm.push([dir, steps.to_i])
end

# movement vector of head
# start vector of head and tail
vecHead = [0,0]
vecTail_1 = [0,0]
vecTail_2 = [0,0]
vecTail_3 = [0,0]
vecTail_4 = [0,0]
vecTail_5 = [0,0]
vecTail_6 = [0,0]
vecTail_7 = [0,0]
vecTail_8 = [0,0]
vecTail_9 = [0,0]


comm.each do |element|
  puts element.inspect
  (1..element[1]).each { |steps|
    case element[0]
    when 'R'
      vecHead[0] += 1
    when 'L'
      vecHead[0] -= 1
    when 'U'
      vecHead[1] += 1
    when 'D'
      vecHead[1] -= 1
    end
    puts "Movement of head #{vecHead}"

    #-----TAIL MOVEMENT-----
    vecTail_1 = tailMove(vecHead,vecTail_1,1)
    vecTail_2 = tailMove(vecTail_1,vecTail_2,2)
    vecTail_3 = tailMove(vecTail_2,vecTail_3,3)
    vecTail_4 = tailMove(vecTail_3,vecTail_4,4)
    vecTail_5 = tailMove(vecTail_4,vecTail_5,5)
    vecTail_6 = tailMove(vecTail_5,vecTail_6,6)
    vecTail_7 = tailMove(vecTail_6,vecTail_7,7)
    vecTail_8 = tailMove(vecTail_7,vecTail_8,8)
    vecTail_9 = tailMove(vecTail_8,vecTail_9,9)

    visitedFields.push([vecTail_9[0].to_s,vecTail_9[1].to_s])
  }
end

puts visitedFields.inspect
visitedFieldsUnique = visitedFields.uniq
puts visitedFieldsUnique.inspect
puts visitedFieldsUnique.length


