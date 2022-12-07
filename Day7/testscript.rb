folder_sizes = Hash.new(0)

# Set path
path = 'Day7/input.txt'
#path = 'Day7/test.txt'

File.readlines(path, chomp: true).map(&:split).each_with_object([]) do |line, stack|
  puts '------NEW------'
  puts line.inspect
  case line
  in ['$', 'cd', '..']
    stack.pop
  in ['$', 'cd', folder]
    stack.push [stack.last, folder].compact.join(' ')
    puts stack.inspect
  in [size, file] if size.match?(/^\d+$/)
    stack.each { |i| folder_sizes[i] += size.to_i }
  else
  end
  puts stack.inspect
  puts folder_sizes.inspect
end

puts folder_sizes.values.reject { |i| i > 100_000 }.sum
puts folder_sizes.values.reject { |i| i < folder_sizes['/'] - 40_000_000 }.min

puts folder_sizes.length