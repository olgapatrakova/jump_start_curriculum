# Numbers program. Show how many times a number appeared in user input and among randomly generated numbers using 2 different hashes.
# Create the first hash with arrays as a value
numbers = Hash.new
random_numbers = Array.new
random_numbers_count = 5
random_numbers_count.times do |i|
  random_numbers[i] = rand(12..21)
end
numbers[:random_numbers] = random_numbers
# Get user's numbers
user_numbers = Array.new
user_numbers_count = 5
puts "\nPlease provide five integer values between 12 and 21, both inclusive:"
user_numbers_count.times do |i|
  print "What's number #{i+1}? "
  user_numbers[i] = gets.chomp.to_i
end
numbers[:user_input] = user_numbers
# Create the second hash with randomly generated or user's numbers as keys
count_numbers = Hash.new
random_numbers_count.times do |i|
  rn = numbers[:random_numbers][i]
  if count_numbers[rn] != nil
    count_numbers[rn][:random] += 1
  else
    count_numbers[rn] = {random: 1, user: 0}
  end
end
user_numbers_count.times do |i|
  un = numbers[:user_input][i]
  if count_numbers[un] != nil
    count_numbers[un][:user] += 1
  else
    count_numbers[un] = {random: 0, user: 1}
  end
end
# Ask the user to supply three numbers and share the count of times
# the number was generated by the program or was provided earlier by the user
3.times do |check_number|
  times_random = 0c
  times_user = 0
  print "\nGive me a number you want information about: "
  check_number = gets.chomp.to_i
  puts "Using only the first hash:"
  # First hash is a hash where:
  # Keys - either random numbers (numbers generated randomly by the program) or user input (numbers entered by a user)
  # Values - array containing numbers
  random_numbers_count.times do |i|
    if check_number == numbers[:random_numbers][i]
      times_random += 1
    end
  end
  if times_random > 0
    puts "\sThe number, #{check_number} shows up #{times_random} time(s) in the randomly generated numbers."
  else
    puts "\sThe number, #{check_number} did not show in the randomly generated numbers."
  end
  user_numbers_count.times do |i|
    if check_number == numbers[:user_input][i]
      times_user += 1
    end
  end
  if times_user > 0
    puts "\sThe number, #{check_number} was provided #{times_user} time(s) by the user earlier."
  else
    puts "\sThe number, #{check_number} was not provided by the user earlier."
  end
  puts "Using only the second hash:"
  # Second hash is a hash where:
  # Keys - numbers to check
  # Values - another hash containing count of numbers generated randomly and entered by a user
  count_numbers.keys.each do |key|
    if check_number == count_numbers.keys[key]
      if count_numbers[check_number][:random] > 0
        puts "\sThe number, #{check_number} shows up #{count_numbers[check_number][:random]} time(s) in the randomly generated numbers."
      else
        puts "\sThe number, #{check_number} did not show in the randomly generated numbers."
      end
      if count_numbers[check_number][:user] > 0
        puts "\sThe number, #{check_number} was provided #{count_numbers[check_number][:user]} time(s) by the user earlier."
      else
        puts "\sThe number, #{check_number} was not provided by the user earlier."
      end
    end
  end
end
