# Ada C12 - Tiffany Chio
# This program analyzes driver data from a rideshare service.

puts `clear`

rides = { "DR0001" => [{ date: "3rd Feb 2016", cost: 10, rider_ID: "RD0003", rating: 3 },
                      { date: "3rd Feb 2016", cost: 30, rider_ID: "RD0015", rating: 4 },
                      { date: "5th Feb 2016", cost: 45, rider_ID: "RD0003", rating: 2 }],
         "DR0002" => [{ date: "3rd Feb 2016", cost: 25, rider_ID: "RD0073", rating: 5 },
                      { date: "4th Feb 2016", cost: 15, rider_ID: "RD0013", rating: 1 },
                      { date: "5th Feb 2016", cost: 35, rider_ID: "RD0066", rating: 3 }],
         "DR0003" => [{ date: "4th Feb 2016", cost: 5, rider_ID: "RD0066", rating: 5 },
                      { date: "5th Feb 2016", cost: 50, rider_ID: "RD0003", rating: 2 }],
         "DR0004" => [{ date: "3rd Feb 2016", cost: 5, rider_ID: "RD0022", rating: 5 },
                      { date: "4th Feb 2016", cost: 10, rider_ID: "RD0022", rating: 4 },
                      { date: "5th Feb 2016", cost: 20, rider_ID: "RD0073", rating: 5 }] }

# Returns maximum VALUE of a hash.
def find_hash_max(a_hash)
  return a_hash.values.max
end

# Returns array of keys who's value matches the target value.
def find_target_hash_keys(a_hash, target_value)
  return a_hash.select { |key, value| value == target_value }.keys
end

# Converts arrays to string in grammatically correct format:
# ["apple", "banana", "orange"] -> "apple, banana, and orange"
# ["apple", "banana"] -> "apple and banana"
def convert_array_to_string(an_array)
  array_len = an_array.length
  combined_string = ""

  if array_len == 2
    combined_string << an_array[0] << " and " << an_array[1]
    return combined_string
  end

  an_array.each_with_index do |string, i|
    if i == 0
      combined_string << string
    elsif i == array_len - 1
      combined_string << ", and " << string
    else
      combined_string << ", " << string
    end
  end

  return combined_string
end

drivers_total_earned = {}
drivers_avg_rating = {}

rides.each do |driver, ride_array|
  # Hashes will be used later to find maxes.
  drivers_total_earned[driver] = ride_array.sum { |trip| trip[:cost] }
  drivers_avg_rating[driver] = ride_array.sum { |trip| trip[:rating] } / ride_array.length.to_f

  daily_earnings = {}

  ride_array.each do |trip|
    if daily_earnings.has_key?(trip[:date])
      daily_earnings[trip[:date]] += trip[:cost]
    else
      daily_earnings[trip[:date]] = trip[:cost]
    end
  end

  # Accounts for multiple max earning days.
  max_earning_day = find_target_hash_keys(daily_earnings, find_hash_max(daily_earnings))

  puts "Driver #{driver} has given #{ride_array.length} rides."
  puts "Driver #{driver} has earned a total of $#{drivers_total_earned[driver]}."
  # Average star rating is formatted to include only two decimal places.
  printf("Driver %s's average rating is %.2f.\n", driver, drivers_avg_rating[driver])
  puts "Driver #{driver} earned the most on #{convert_array_to_string(max_earning_day)}.\n\n"
end

# Accounts for ties.
max_earning = find_hash_max(drivers_total_earned)
max_earn_drivers = find_target_hash_keys(drivers_total_earned, max_earning)

puts "#{convert_array_to_string(max_earn_drivers)} made the most money: $#{max_earning}."

# Accounts for ties.
max_avg_rating = find_hash_max(drivers_avg_rating)
highest_rated_drivers = find_target_hash_keys(drivers_avg_rating, max_avg_rating)

printf("%s received the highest average rating: %.2f.\n", convert_array_to_string(highest_rated_drivers), max_avg_rating)
