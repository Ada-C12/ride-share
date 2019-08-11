weekly_rides = [ 
  {driver_id: "DR0004", date: "3rd Feb 2016", cost: 5, rider_id: "RD0022", rating: 5}, 
  {driver_id: "DR0001", date: "3rd Feb 2016", cost: 10, rider_id: "RD0003", rating: 3},
  {driver_id: "DR0002", date: "3rd Feb 2016", cost: 25, rider_id: "RD0073", rating: 5}, 
  {driver_id: "DR0001", date: "3rd Feb 2016", cost: 30, rider_id: "RD0015", rating: 4},
  {driver_id: "DR0003", date: "4th Feb 2016", cost: 5, rider_id: "RD0066", rating: 5}, 
  {driver_id: "DR0004", date: "4th Feb 2016", cost: 10, rider_id: "RD0022", rating: 4},
  {driver_id: "DR0002", date: "4th Feb 2016", cost: 15, rider_id: "RD0013", rating: 1}, 
  {driver_id: "DR0003", date: "5th Feb 2016", cost: 50, rider_id: "RD0003", rating: 2},
  {driver_id: "DR0002", date: "5th Feb 2016", cost: 35, rider_id: "RD0066", rating: 3}, 
  {driver_id: "DR0004", date: "5th Feb 2016", cost: 20, rider_id: "RD0073", rating: 5},
  {driver_id: "DR0001", date: "5th Feb 2016", cost: 45, rider_id: "RD0003", rating: 2}
]

# Extract rides from main data structure
def extract_rides(weekly_rides)
  driver_rides = {}
  weekly_rides.each do |ride|
    id = ride[:driver_id]
    # Check if driver_id exists in driver_rides hash & increment by 1
    if driver_rides.key?(id) 
      driver_rides[id] += 1
    else 
      driver_rides[id] = 1
    end 
  end 
  return driver_rides
end 

drivers_weekly_rides = extract_rides(weekly_rides)

# Calculating the number of rides each driver has given
def calculate_total_rides(drivers_weekly_rides)
  drivers_weekly_rides.each do |id, ride_count|
    puts "Driver #{id} has given #{ride_count} rides."
  end 
  return drivers_weekly_rides
end 

puts "\nTotal rides per driver:"
calculate_total_rides(drivers_weekly_rides)

# Extract the pay per each driver 
def extract_driver_pay(weekly_rides)
  driver_pay = {}
  weekly_rides.each do |ride|
    id = ride[:driver_id]
    pay = ride[:cost]
    # Check if driver_id exists in driver_pay hash & add pay to existing values array
    if driver_pay.key?(id) 
      driver_pay[id].push(pay)
    else
      # If driver_id doesn't exist yet create a new array to store pay
      driver_pay[id] = [pay]
    end    
  end
  return driver_pay
end 

weekly_driver_pay = extract_driver_pay(weekly_rides)

# Calculate the total amount of money each driver has made
def calculate_total_pay(weekly_driver_pay)
  weekly_driver_pay.each do |id, pay|
    total_pay = pay.sum
    weekly_driver_pay[id] = total_pay
    puts "Driver #{id} made a total of $#{total_pay}."
  end 
  return weekly_driver_pay
end 

puts "\nTotal pay per driver:"
total_driver_pay = calculate_total_pay(weekly_driver_pay)

# Calculate the driver with highest pay
def calculate_highest_pay(total_driver_pay)
  sorted_driver_pay = total_driver_pay.sort_by { |id, pay| pay }
  puts "\nThe driver who made the most was: #{sorted_driver_pay.last[0]} at $#{sorted_driver_pay.last[1]}." 
  return sorted_driver_pay
end 

calculate_highest_pay(total_driver_pay)

# Extract driver ratings 
def extract_driver_ratings(weekly_rides)
  driver_ratings = {}
  weekly_rides.each do |ride|
    id = ride[:driver_id]
    rating = ride[:rating]
    # Check if driver_id exists in driver_rating hash
    if driver_ratings.key?(id)
      driver_ratings[id].push(rating)
    else
      # If driver_id doesn't exist, create a new array
      driver_ratings[id] = [rating]
    end
  end 
  return driver_ratings
end 

weekly_driver_ratings = extract_driver_ratings(weekly_rides)

# Calculate average rating per driver 
def calculate_average_rating(weekly_driver_ratings)
  weekly_driver_ratings.each do |id, rating|
    average_rating = rating.sum / rating.length
    puts "Driver #{id} has an average rating of #{average_rating}."
    weekly_driver_ratings[id] = average_rating
  end 
  return weekly_driver_ratings
end 

puts "\nAverage rating per driver:"
average_ratings = calculate_average_rating(weekly_driver_ratings)

# Calculate the driver with the highest average rating
def calculate_highest_rating(average_ratings)
  sorted_driver_ratings = average_ratings.sort_by { |id, rating| rating }
  puts "\nThe driver with the highest average rating of #{sorted_driver_ratings.last[1]} was #{sorted_driver_ratings.last[0]}."
  return sorted_driver_ratings
end 

calculate_highest_rating(average_ratings)