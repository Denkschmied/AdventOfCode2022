require 'yaml'

def monkeyOperations(number,item)
  case number
  when 0
    item = (item * 19) % (2 * 3 * 5 * 7 * 11 * 13 * 17 * 19 * 23 * 29)
    if item.floor%23 == 0
      nextMonkey = 2
    else
      nextMonkey = 3
    end
  when 1
    item = (item + 6) % (2 * 3 * 5 * 7 * 11 * 13 * 17 * 19 * 23 * 29)
    if item.floor%19 == 0
      nextMonkey = 2
    else
      nextMonkey = 0
    end
  when 2
    item = (item * item) % (2 * 3 * 5 * 7 * 11 * 13 * 17 * 19 * 23 * 29)
    if item.floor%13 == 0
      nextMonkey = 1
    else
      nextMonkey = 3
    end
  when 3
    item = (item + 3) % (2 * 3 * 5 * 7 * 11 * 13 * 17 * 19 * 23 * 29)
    if item.floor%17 == 0
      nextMonkey = 0
    else
      nextMonkey = 1
    end
  end
  return item, nextMonkey
end

# -----------TEST-----------
package, nextM = monkeyOperations(2,79)

# define the start values of the monkeys
monkey = {0 => [79,98], 1 => [54, 65, 75, 74], 2 => [79, 60, 97], 3 => [74]}
monkeyInsp = {0 => 0, 1 => 0, 2 => 0, 3 => 0}

=begin
monkey = {0 => [91, 58, 52, 69, 95, 54],
          1 => [80, 80, 97, 84],
          2 => [86, 92, 71],
          3 => [96, 90, 99, 76, 79, 85, 98, 61],
          4 => [60, 83, 68, 64, 73],
          5 => [96, 52, 52, 94, 76, 51, 57],
          6 => [75],
          7 => [83, 75]}

monkeyInsp = {0 => 0,
              1 => 0,
              2 => 0,
              3 => 0,
              4 => 0,
              5 => 0,
              6 => 0,
              7 => 0}
=end
# save monkey items to file
(0..monkey.length-1).each do |n|
  File.open('Day11/output/'+n.to_s+'.txt',"w"){|f|f.write monkey[n].join("\n")}
  File.open('Day11/initFiles/'+n.to_s+'.txt',"w"){|f|f.write monkey[n].join("\n")}
end


(1..10000).each do|round|
  # one round
  (0..monkey.length-1).each do |n|
    # load monkey file
    currentFile = File.open('Day11/output/'+n.to_s+'.txt')
    monkeyCurrent = currentFile.readlines.map(&:chomp)

    #puts monkeyCurrent.inspect
    monkeyCurrent.each do|item|
      #puts "This is monkey #{n} and handles #{item}"
      package, nextM = monkeyOperations(n,item.to_i)
      #puts "The package with value #{package} is sent to monkey #{nextM}"

      # open target file
      targetFile = File.open('Day11/output/'+nextM.to_s+'.txt')
      targetMonkey = targetFile.readlines.map(&:chomp)
      #puts "target file prio new entry is #{targetMonkey.inspect}"

      # append item to target array
      targetMonkey.push(package)

      #puts "target file prio new entry is #{targetMonkey.inspect}"
      # write file
      File.write('Day11/output/'+nextM.to_s+'.txt', [targetMonkey].join("\n"))

      # close target file
      targetFile.close

      # add one to the number of inspections
      monkeyInsp[n] += 1
    end
    # close file
    currentFile.close

    # delete file entries
    File.open('Day11/output/'+n.to_s+'.txt',"w"){}
  end
  print '.'
end

#puts monkey.inspect
puts monkeyInsp.inspect

puts monkey.inspect
puts monkeyInsp.inspect
