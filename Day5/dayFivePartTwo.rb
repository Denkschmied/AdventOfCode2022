# Define variables
b = []
steps=0

# Generate Arrays with crates
# Test Scenario
# crates = [%w[Z N],%w[M C D],%w[P]]

# Real Scenario
# =begin
crates = [%w[V C D R Z G B W],
          %w[G W F C B S T V],
          %w[C B S N W],
          %w[Q G M N J V C P],
          %w[T S L F D H B],
          %w[J V T W M N],
          %w[P F L C S T G],
          %w[B D Z],
          %w[M N Z W]]
# =end

puts 'BEFORE'
puts crates.inspect


# Set path to order liste
path = 'Day5/input.txt'
#path = 'Day5/test.txt'

# Open File
file = File.open(path)

# Read content of file
file_data = file.read

# function for moving items
def move_items(fromCrate, toCrate, number)
  toCrate = toCrate + fromCrate.last(number)
  puts toCrate.inspect
  fromCrate.pop(number)
  puts fromCrate.inspect
  return fromCrate,toCrate
end

# split in lines
file_data.split(/\n/).each do |line|
  fromCrateIndex = 0
  toCrateIndex = 0
  puts line.inspect
  j = 0
  line.split(/ /).each do |element|
    # puts element.inspect
    #puts j
    case j
    when 1
      steps = element.to_i
    when 3
      fromCrateIndex = element.to_i-1
    when 5
      toCrateIndex = element.to_i-1
    end
    j += 1
  end
  puts steps
  (crates[fromCrateIndex],crates[toCrateIndex]) = move_items(crates[fromCrateIndex],crates[toCrateIndex],steps)
end

puts 'AFTER'
crates.each { |crateItem| puts crateItem.inspect }
