drivers = {
  "DR0001" => {
    date: ["3rd Feb 2016", "3rd Feb 2016", "5th Feb 2016"],
    cost: [10, 30, 45],
    rider: ["RD0003", "RD0003", "RD0003"],
    rating: [3, 4, 2] 
  },
  "DR0002" => {
    date: ["3rd Feb 2016", "4th Feb 2016", "5th Feb 2016"],
    cost: [25, 15, 35],
    rider: ["RD0073", "RD0013", "RD0066"],
    rating: [5, 1, 3] 
  },
  "DR0003" => {
    date: ["4th Feb 2016", "5th Feb 2016"],
    cost: [5, 50],
    rider: ["RD0066", "RD0003"],
    rating: [5, 2]
  },
  "DR0004" => {
    date: ["3rd Feb 2016", "4th Feb 2016", "5th Feb 2016"],
    cost: [5, 10, 20],
    rider: ["RD0022", "RD0022", "RD0073"],
    rating: [5, 4, 5,]
  }
}

# creates array to store total earnings of each driver
total_earnings_all = []
# creates array to store average rating of each driver
avg_ratings_all = []

drivers.each_key do |driver_id|
  total_rides = drivers[driver_id][:date].length
  
  total_earnings = drivers[driver_id][:cost].sum
  total_earnings_all << total_earnings

  avg_rating = drivers[driver_id][:rating].sum / drivers[driver_id][:rating].length
  avg_ratings_all << avg_rating
  
  # prints stats for each driver
  puts "#{driver_id} "
  puts "  Rides: #{total_rides}"
  puts "  Total earnings: $#{sprintf("%.2f", total_earnings)}" 
  puts "  Average rating: #{avg_rating}"
end

# creates array to store driver ids from drivers hash
driver_ids = drivers.map do |driver_id, hash|
  driver_id
end

highest_earner_index = total_earnings_all.index(total_earnings_all.max)
highest_earner = driver_ids[highest_earner_index]
puts "\nThe driver that made the most money was #{highest_earner}"

highest_rating_index = avg_ratings_all.index(avg_ratings_all.max)
highest_rating = driver_ids[highest_rating_index]
puts "The driver with the highest average rating was #{highest_rating}"
