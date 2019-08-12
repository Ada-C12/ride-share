def print_number_rides(my_hash)
  my_hash.each do |driver, rides|
    total_rides = rides.length
    print "#{driver} did #{total_rides} "

    if total_rides == 1
      puts "ride."
    else
      puts "rides."
    end
  end
end

def get_drivers_earnings(my_hash)
  drivers_earnings = {}

  my_hash.each do |driver, rides|
    earnings = rides.sum do |ride|
      ride[:cost]
    end
    drivers_earnings[driver] = earnings
  end

  return drivers_earnings
end

def get_drivers_avg_ratings(my_hash)
  avg_ratings = {}

  my_hash.each do |driver, rides|
    ratings = rides.map do |ride|
      ride[:rating]
    end
    avg_ratings[driver] = ratings.sum / ratings.length.to_f
  end

  return avg_ratings
end

def highest_keys(my_hash)
  max_value = my_hash.values.max

  highest_keys = my_hash.select do |_key, value|
    value == max_value
  end

  return highest_keys
end

def get_money_per_day(my_array)
  days = {}

  my_array.each do |ride|
    day = ride[:date].to_sym

    if days.has_key?(day)
      days[day] += ride[:cost]
    else
      days[day] = ride[:cost]
    end
  end

  return days
end

def print_drivers_best_days(my_hash)
  my_hash.each do |driver, days|
    money_per_day = get_money_per_day(days)

    best_days = highest_keys(money_per_day)

    puts "Driver #{driver} made the most money on: #{best_days.keys.join(", ")}."
  end
end

ride_history = {
  DR001:
  [
    { date: "3rd Feb 2016", cost: 10, rider_id: "RD0003", rating: 3 },
    { date: "3rd Feb 2016", cost: 30, rider_id: "RD0015", rating: 4 },
    { date: "5th Feb 2016", cost: 45, rider_id: "RD0003", rating: 2 }
  ],
  DR002:
  [
    { date: "3rd Feb 2016", cost: 25, rider_id: "RD0073", rating: 5 },
    { date: "4th Feb 2016", cost: 15, rider_id: "RD0013", rating: 1 },
    { date: "5th Feb 2016", cost: 35, rider_id: "RD0066", rating: 3 }
  ],
  DR003:
  [
    { date: "4th Feb 2016", cost: 5, rider_id: "RD0066", rating: 5 },
    { date: "5th Feb 2016", cost: 50, rider_id: "RD0003", rating: 2 }
  ],
  DR004:
  [
    { date: "3rd Feb 2016", cost: 5, rider_id: "RD0022", rating: 5 },
    { date: "4th Feb 2016", cost: 10, rider_id: "RD0022", rating: 4 },
    { date: "5th Feb 2016", cost: 20, rider_id: "RD0073", rating: 5 }
  ]
}

puts "RIDE SHARE SUMMARY"

puts "\nThe number of rides each driver has given:"
print_number_rides(ride_history)

puts "\nThe total amount of money each driver has made:"
drivers_earnings = get_drivers_earnings(ride_history)

drivers_earnings.each do |driver, earnings|
  puts "#{driver} has made $#{"%.2f" % earnings}."
end

puts "\nThe average rating for each driver:"
average_ratings = get_drivers_avg_ratings(ride_history)

average_ratings.each do |driver, average|
  puts "#{driver} has an average rating of #{"%.2f" % average}."
end

print "\nThe highest earning "
highest_earning_drivers = highest_keys(drivers_earnings)

if highest_earning_drivers.length == 1
  print "driver is: "
else
  print "drivers are: "
end

puts "#{highest_earning_drivers.keys.join(", ")}."

print "\nThe highest rated "
highest_rated_drivers = highest_keys(average_ratings)

if highest_rated_drivers.length == 1
  print "driver is: "
else
  print "drivers are: "
end

puts "#{highest_rated_drivers.keys.join(", ")}."
puts "\n"

print_drivers_best_days(ride_history)
