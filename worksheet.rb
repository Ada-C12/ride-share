########################################################
# Step 1: Establish the layers
  # 1) Drivers
  # 2) Rides
  # 3) Details about their rides (date, riderid, rating)
# Which layers are nested in each other?
  # Details about each ride are a hash nested in an array of rides,
  #  which are nested in an array of hashes labeled by driver id.
# Which layers of data "have" within it a different layer?
  # DriverID has a different layer within it, containing each ride, 
  #  and each ride has all the other info within it
# Which layers are "next" to each other?
  #  The date, riderid, and rating are next to eachother.

########################################################
# Step 2: Assign a data structure to each layer
  # 1) Drivers - Hash
  # 2) Rides - Array
  # 3) Details about their rides (date, riderid, rating) - Hash

########################################################
# Step 3: Make the data structure!

driver_data = {
  DR0001: [
    {
      "DATE" => "3rd Feb 2016",
      "COST" => 10,
      "RIDER_ID" => :RD0003,
      "RATING" => 3
    },
    {
      "DATE" => "3rd Feb 2016",
      "COST" => 30,
      "RIDER_ID" => :RD0015,
      "RATING" => 4
    },
    {
      "DATE" => "5th Feb 2016",
      "COST" => 45,
      "RIDER_ID" => :RD0003,
      "RATING" => 2
    }
  ],
  DR0002: [
    {
      "DATE" => "3rd Feb 2016",
      "COST" => 25,
      "RIDER_ID" => :RD0073,
      "RATING" => 5
    },
    {
      "DATE" => "4th Feb 2016",
      "COST" => 15,
      "RIDER_ID" => :RD0013,
      "RATING" => 1
    },
    {
      "DATE" => "5th Feb 2016",
      "COST" => 35,
      "RIDER_ID" => :RD0066,
      "RATING" => 3
    }
  ],  
  DR0003: [
    {
      "DATE" => "4th Feb 2016",
      "COST" => 5,
      "RIDER_ID" => :RD0066,
      "RATING" => 5
    },
    {
      "DATE" => "5th Feb 2016",
      "COST" => 50,
      "RIDER_ID" => :RD0003,
      "RATING" => 2
    }
  ],
  DR0004: [
    {
      "DATE" => "3rd Feb 2016",
      "COST" => 5,
      "RIDER_ID" => :RD0022,
      "RATING" => 5
    },
    {
      "DATE" => "4th Feb 2016",
      "COST" => 10,
      "RIDER_ID" => :RD0022,
      "RATING" => 4
    },
    {
      "DATE" => "5th Feb 2016",
      "COST" => 20,
      "RIDER_ID" => :RD0073,
      "RATING" => 5
    }
  ]  
}

########################################################
# Step 4: Total Driver's Earnings and Number of Rides

# Use iteration blocks to print the following answers:

# - the number of rides each driver has given
driver_data.each do |driver_id, rides|
  puts "Driver ID '#{driver_id}' has given #{rides.length} rides.\n"
end
puts

# - the total amount of money each driver has made
driver_total_earnings = {}
driver_data.each do |driver_id, rides|
  total_earnings = rides.sum do |ride_data|
    ride_data["COST"]
  end
  driver_total_earnings[driver_id] = total_earnings
  puts "Driver ID '#{driver_id}' has earned a total of $%.2f" % total_earnings
end
puts

# - the average rating for each driver
driver_average_ratings = {}
driver_data.each do |driver_id, rides|
  total_ratings = rides.sum do |ride_data|
    ride_data["RATING"]
  end
  average_rating = total_ratings.to_f / rides.length
  driver_average_ratings[driver_id] = average_rating
  puts "Driver ID '#{driver_id}'s average rating is %.1f." % average_rating
end
puts

# - Which driver(s) made the most money?
highest_amount_earned = driver_total_earnings.values.max
highest_earning_drivers = driver_total_earnings.select do |driver, earnings| 
  earnings == highest_amount_earned
end
# display who made the most money
if highest_earning_drivers.length == 1
  puts "Driver #{highest_earning_drivers.key\
  (highest_amount_earned)} made the most money, $%.2f!" % highest_amount_earned
else
  puts "Drivers #{highest_earning_drivers.keys.join(", ")} "\
  "earned the most money: $%.2f!" % highest_amount_earned
end
puts

# - Which driver has the highest average rating?
highest_average_rating = driver_average_ratings.values.max
highest_avg_rated_driver = driver_average_ratings.key(highest_average_rating)
puts "Driver #{highest_avg_rated_driver} is the highest "\
"rated driver with an average rating of %.1f." % highest_average_rating
puts

# - Optional: For each driver, on which day did they make the most money?
driver_daily_earnings = {}
driver_data.each do |driver, rides|
  driver_daily_earnings[driver] = Hash.new
  # create list of unique dates for the driver
  unique_dates_ride_data = rides.uniq do |ride|
    ride["DATE"]
  end
  unique_dates = unique_dates_ride_data.map do |ride_data|
    ride_data["DATE"]
  end
  unique_dates.each do |date|
    driver_daily_earnings[driver][date] = 0
  end
  # loop through rides, if ride["DATE"] in unique dates, add cost to unique date
  rides.each do |ride|
    if unique_dates.include? ride["DATE"]
      driver_daily_earnings[driver][ride["DATE"]] += ride["COST"]
    end
  end  
  # display first date with the highest earnings for the day
  highest_daily_earning = driver_daily_earnings[driver].values.max
  highest_earning_day = \
  driver_daily_earnings[driver].key(highest_daily_earning)
  puts "Driver #{driver} made the most money on " \
  "#{highest_earning_day} with $%.2f." % highest_daily_earning
end
