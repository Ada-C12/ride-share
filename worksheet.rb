puts "\nWelcome to my Rideshare program!"

# Create a new hash called 'drivers_data' to store all rideshare data
drivers_data = Hash.new

# Input data from csv file with headers by each row in the csv file
require 'csv'
CSV.foreach('rides.csv', headers: true) do |row|

# Store the driver_id and date of each row as symbol
  driver_id = row['DRIVER_ID'].tr(" ", "_").to_sym
  date = row['DATE'].tr(" ", "_").to_sym  
  
# Store the rider_id, cost, & rating for each row in a hash called 'ride'
  ride = {
      rider_id: row['RIDER_ID'],
      cost: row['COST'].to_f,
      rating: row['RATING'].to_f,
    }

# Create a data stucture from csv inputed data
# - drivers_data(hash) contains keys which are the driver_ids
# - driver_id keys contain arrays
# - these arrays contain the rides for that date - each ride is a hash called 'ride' stored above

# while iterating through if the key for current driver_id doesn't exist -> create new driver_id key
#   once the key for driver_id has been created - check to see if the key for date has been created -> create new date key
#   if the driver_id and date keys are already created -> add the ride to end of array for date
  if drivers_data[driver_id].nil?
      drivers_data[driver_id] = Hash.new
      drivers_data[driver_id][date] = Array.new
      drivers_data[driver_id][date].push(ride)
  elsif drivers_data[driver_id][date].nil?
      drivers_data[driver_id][date] = Array.new
      drivers_data[driver_id][date].push(ride)
  else
      drivers_data[driver_id][date].push(ride)
  end
end

driver_stats = Hash.new
avg_ratings = Array.new
earned_sums = Array.new
day_stats = Hash.new

# for reach driver calculate their sum of earned, sum of ratings, and sum of trips
drivers_data.each do |driver,rides|
  earned_sum = 0
  rating_sum = 0
  trips_sum = 0

# for each drivers ride data, calculate the sum of earned by day
  rides.each do |date,trips|
    trip_earned_sum = 0
    day_stats[date] = 0

    trips.each do |trip|
        trip_earned_sum += trip[:cost]
        rating_sum += trip[:rating]
        trips_sum += 1
    end
      
# add iterations are complete for each date - add sum totals to 'day_stats' hash with key of current date
    day_stats[date] += trip_earned_sum
# add each days sum to calculate total earnings sum
    earned_sum += trip_earned_sum
  end

# after iterations are complete for all ride data - add sum totals to new hash called 'stats'
  stats = {
     driver_id: driver,
     earned_sum: earned_sum,
     avg_rating: rating_sum/trips_sum,
    }

# assign stats to key which is the current driver id in hash 'driver stats'  
  driver_stats[driver] = stats

# find the max earning day using 'day_stats' hash values
# create new array of dates where the earnings were the max - allows for multiple max earning days
  max_earnings = day_stats.values.max
  max_earning_dates = day_stats.select {|date,earnings| max_earnings == earnings}.map {|date,value| date.to_s.tr("_", " ") }

# output current drivers stats each iteration  
  puts "\n-#{driver}- 
  Rides Given: #{trips_sum}
  Total Earned: $#{'%.2f' % earned_sum}
  Average Rating: #{stats[:avg_rating].round(2)}
  Max Earnings: $#{'%.2f' % max_earnings} on #{max_earning_dates.join(', ')}"
end

# find max earned by finding max of array of driver earnings
# add drivers id to array if they had the max earnings - allows for multiple max earning drivers
max_earned = (driver_stats.values.map {|stats| stats[:earned_sum]}).max
top_earners_ids = (driver_stats.values.select { |stats| max_earned == stats[:earned_sum] }).map { |top_drivers| top_drivers[:driver_id].to_s }

# find max average rating for drivers and add driver ids to array if they had highest rating
# calculated similar to max_earned
max_avg_rating = (driver_stats.values.map {|stats| stats[:avg_rating]}).max
top_avg_rating_ids = (driver_stats.values.select { |stats| max_avg_rating == stats[:avg_rating] }).map { |top_drivers| top_drivers[:driver_id].to_s }

# ouput the drivers with the max earnings, highest avg rating and their earnings and rating
puts "\n-Summary-
  #{top_earners_ids.join(' and ')} made the most money at $#{'%.2f' % max_earned}
  #{top_avg_rating_ids.join(' and ')} has the highest average rating of #{max_avg_rating.round(2)}\n\n"
