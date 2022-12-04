# Define empty array
sumMe = 0

# Set path
path = 'Day2/input.txt'
path = 'Day2/test.txt'

# Open File
file = File.open(path)

# Read content of file
file_data = file.read

# Split file in single lines
file_data.split(/\n/).each do |line|
  # split line in single elements
  me = 0
  opp = 0
  line.split(/ /).each do |element|
    # puts 'This is the element', element
    # check what type of element it is and assign a value
    case element
    when 'A'
      opp = 1
      # puts 'Opponent = Rock and gets 1'
    when 'B'
      opp = 2
      # puts 'Opponent = Paper and gets 2'
    when 'C'
      opp = 3
      # puts 'Opponent = Scissors and gets 3'
    when 'X'
      me = 1
      # puts 'Me = Rock and gets 1'
    when 'Y'
      me = 2
      # puts 'Me = Paper and gets 2'
    when 'Z'
      me = 3
      # puts 'Me = Scissors and gets 3'
    end
    # puts 'opp', opp
    # puts 'me', me
  end
  sumMe = sumMe + me
  # puts 'sumMe', sumMe

  # decide, who wins
  if (opp==1 && me==3)||(opp==3 && me==2)||(opp==2 && me==1)
    win = 1
    # puts 'OPPONENT WINS'
  elsif (opp==3 && me==1)||(opp==2 && me==3)||(opp==1 && me==2)
    win = 2
    # puts 'I WON'
  else
    win = 3
    # puts 'NO ONE WON'
  end

  case win
  when 1
    sumMe = sumMe + 0
    # puts 'Opponent wins'
  when 2
    sumMe = sumMe + 6
    # puts 'I win'
  when 3
    sumMe = sumMe + 3
    # puts 'No one wins'
  end
  # puts sumMe
end

puts "sumMe " , sumMe
