# Define variables
n = 0
y = 0
a=[]
x = 0
A = []
lineArray = Array.new
maxTree = 0

# Set path
#path = 'Day8/input.txt'
path = 'Day8/test.txt'

# Open File
file = File.open(path)

# Read content of file
file_data = file.read

# Split the data (input was a string); create an array
file_data.split(/\n/).each do |line|
  puts '----------NEW------------'
  A.push(line)
  puts A.inspect
end
puts A.inspect
puts A.length

B = Array.new(A.length){Array.new(A[0].length)}
puts B.inspect

y=0

# check from left to right
A.each do |line|
  puts line
  x = 0
  line.split(//).each do |letter|
    lineArray[x] = letter
    x += 1
  end
  puts lineArray.inspect

  # set trees at the edge to true (left and right edge)
  B[y][0] = true
  B[y][lineArray.length-1] = true

  # find visible tree from left to right
  maxTree = lineArray[0].to_i
  for a in 1..lineArray.length do
    if lineArray[a].to_i > maxTree
      maxTree = lineArray[a].to_i
      if B[y][a] == nil
        B[y][a]=true
      end
    end
  end

  # find visible tree from right to left
  maxTree = lineArray[lineArray.length].to_i
  for a in 0..lineArray.length-1 do
    if lineArray[lineArray.length-a].to_i > maxTree
      maxTree = lineArray[lineArray.length-a].to_i
      if B[y][lineArray.length-a] == nil
        B[y][lineArray.length-a]=true
      end
    end
  end
  y += 1
end

puts B.inspect

# check columns
# iterate over column
for n in 0..A.length-1 do
  #iterate over rows
  columnArray=[]
  A.each do |line|
    puts line[n]
    columnArray.push(line[n].to_i)
  end
  puts columnArray.inspect

  # set top item to true
  B[0][n]=true

  # top to bottom
  maxTree = columnArray[0].to_i
  for a in 1..columnArray.length-1 do
    if columnArray[a].to_i > maxTree
      maxTree = columnArray[a]
      if B[a][n] == nil
        B[a][n] = true
      end
    end
  end

  # bottom to top
  B[columnArray.length-1][n] = true
  maxTree = columnArray[columnArray.length-1].to_i
  for a in 1..columnArray.length do
    if columnArray[columnArray.length-a].to_i > maxTree
      maxTree = columnArray[columnArray.length-a]
      if B[columnArray.length-a][n] == nil
        B[columnArray.length-a][n] = true
      end
    end
  end

end

puts B.inspect
sum=0
B.each do |line|
  line.each do |sign|
    if sign==true
      sum += 1
    end
  end
end

puts sum

# first input 1685 -- too low
puts B.inspect
################## PART TWO ##################
# create an array which should save the free-view score

C = Array.new(A.length){Array.new(A[0].length)}

y=0
A.each do |line|
  x=0
  puts line
  line.split(//).each do |tree|
    if B[y][x]==true
      puts "Tree with height #{tree}"
      # look left
      left = 1
      for n in 1..x do
        if A[y][x-n].to_i >= tree.to_i
          if n == 1
            left = 1
          else
            left += 1
          end
          break
        else
          if n > 1
            left += 1
          end
        end
      end

      # look right
      right = 1
      puts "length of for loop is #{line.length-1}"
      for n in 1..(line.length) do
        if A[y][x+n].to_i >= tree.to_i
          if n == x+1
            right = 1
          else
            right += 1
          end
          break
        else
          if n > 1
            right += 1
          end
        end
        puts right
      end
      C[y][x] = right

    end
    x += 1
  end
  y += 1
end
puts A.inspect
puts B.inspect
puts C.inspect
