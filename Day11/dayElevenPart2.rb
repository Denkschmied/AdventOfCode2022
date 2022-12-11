require 'yaml'

def monkeyOperations(number,item)
  case number
  when 0
    item = (item * 13) % (2 * 3 * 5 * 7 * 11 * 13 * 17 * 19 * 23 * 29)
    if item.floor%7 == 0
      nextMonkey = 1
    else
      nextMonkey = 5
    end
  when 1
    item = (item * item) % (2 * 3 * 5 * 7 * 11 * 13 * 17 * 19 * 23 * 29)
    if item.floor%3 == 0
      nextMonkey = 3
    else
      nextMonkey = 5
    end
  when 2
    item = (item + 7) % (2 * 3 * 5 * 7 * 11 * 13 * 17 * 19 * 23 * 29)
    if item.floor%2 == 0
      nextMonkey = 0
    else
      nextMonkey = 4
    end
  when 3
    item = (item + 4) % (2 * 3 * 5 * 7 * 11 * 13 * 17 * 19 * 23 * 29)
    if item.floor%11 == 0
      nextMonkey = 7
    else
      nextMonkey = 6
    end
  when 4
    item = (item * 19) % (2 * 3 * 5 * 7 * 11 * 13 * 17 * 19 * 23 * 29)
    if item.floor%17 == 0
      nextMonkey = 1
    else
      nextMonkey = 0
    end
  when 5
    item = (item + 3) % (2 * 3 * 5 * 7 * 11 * 13 * 17 * 19 * 23 * 29)
    if item.floor%5 == 0
      nextMonkey = 7
    else
      nextMonkey = 3
    end
  when 6
    item = (item + 5) % (2 * 3 * 5 * 7 * 11 * 13 * 17 * 19 * 23 * 29)
    if item.floor%13 == 0
      nextMonkey = 4
    else
      nextMonkey = 2
    end
  when 7
    item = (item + 1) % (2 * 3 * 5 * 7 * 11 * 13 * 17 * 19 * 23 * 29)
    if item.floor%19 == 0
      nextMonkey = 2
    else
      nextMonkey = 6
    end
  end
  return item, nextMonkey
end

# -----------TEST-----------
package, nextM = monkeyOperations(2,79)

# define the start values of the monkeys
#monkey = {0 => [79,98], 1 => [54, 65, 75, 74], 2 => [79, 60, 97], 3 => [74]}
#monkeyInsp = {0 => 0, 1 => 0, 2 => 0, 3 => 0}

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


(1..10000).each do|round|
  # one round
  (0..monkey.length-1).each do |n|
    monkey[n].each do |item|
      package, nextM = monkeyOperations(n,item.to_i)
      monkey[nextM].push(package)
            # add one to the number of inspections
      monkeyInsp[n] += 1
    end
    monkey[n]=[]
  end
  #print '.'
end

#puts monkey.inspect
puts monkeyInsp.inspect
maxInsp = []
maxInsp = monkeyInsp.values.max(2)
puts maxInsp.inspect
puts maxInsp[0]*maxInsp[1]