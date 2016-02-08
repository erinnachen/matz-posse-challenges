
def initials
  # Iterate over ARGV
  # with each "name", grab the first letter, make it uppercase
  # Print a string that has those letters joined
  inits = ARGV.map { |name| name[0].upcase }
  puts inits.join
end


if __FILE__ == $0
  puts "Welcome"
  initials
end
