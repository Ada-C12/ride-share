trip_data = [
  {
    "driver_id": "DR0001",
    "date": ["3rd Feb 2016", "3rd Feb 2016", "5th Feb 2016"],
    "cost": [10, 30, 45],
    "rider_id": ["RD0003", "RD0015", "RD0003"],
    "rating": [3, 4, 2]
  },

  {
    "driver_id": "DR0002",
    "date": ["3rd Feb 2016", "4th Feb 2016", "5th Feb 2016"],
    "cost": [25, 15, 35],
    "rider_id": ["RD0073", "RD0013", "RD0066"],
    "rating": [5, 1, 3]
  },

  {
    "driver_id": "DR0003",
    "date": ["4th Feb 2016", "5th Feb 2016"],
    "cost": [5, 50],
    "rider_id": ["RD0066", "RD0003"],
    "rating": [5, 2]
  },
  {
    "driver_id": "DR0004",
    "date": ["3rd Feb 2016", "4th Feb 2016", "5th Feb 2016"],
    "cost": [5, 10, 20],
    "rider_id": ["RD0022", "RD0022", "RD0073"],
    "rating": [5, 4, 5]
  }
]

# this function returns the number of rides each driver gave and adds a key/hash pair for
def numberRides(trip_data)
  puts "Total rides per driver: "
  trip_data.each do |rides|
    driver = rides[:driver_id]
    rides_data = rides[:date].length.to_i
    puts "#{driver}: #{rides_data} rides"
    rides[:number_rides] = rides_data
  end
  return trip_data
end


def totalEarnings(trip_data)
  puts "Total earnings: "
  trip_data.each do |costs|
    driver = costs[:driver_id]
    ride_costs = costs[:cost]
    earnings = ride_costs.inject(:+)
    puts "#{driver}: $#{earnings}"
    costs[:earnings] = earnings
  end
  return trip_data
end

def averageRating(trip_data)
  puts "Average ratings: "
  trip_data.each do |ratings|
    driver = ratings[:driver_id]
    ratings_added = ratings[:rating].inject(:+)
    avg_rating = ((ratings_added + 0.0) / ratings[:number_rides]).round(2) # added 0.0 to make avg_rating a float for more accurate calculations
    puts "#{driver}: #{avg_rating} out of 5 stars"
    ratings[:average_rating] = avg_rating
  end
  return trip_data
end

def highestEarner(trip_data)
  highest_earnings = trip_data[0][:earnings]
  highest_earner = []
  highest_earner << trip_data[0][:driver_id]
  trip_data.each_with_index do |earnings, index|
    if index == 0
      next
    elsif trip_data[index][:earnings] == highest_earnings
      highest_earner << trip_data[index][:driver_id]
    elsif trip_data[index][:earnings] > highest_earnings
      highest_earnings = trip_data[index][:earnings]
      highest_earner = []
      highest_earner << trip_data[index][:driver_id]
    end
  end
  puts "The highest earner is #{highest_earner[0]}!"
  return trip_data
end

def highestRating(trip_data)
  highest_avg = trip_data[0][:average_rating]
  best_rated_driver = []
  best_rated_driver << trip_data[0][:driver_id]
  trip_data.each_with_index do |ratings, index|
    if index == 0
      next
    elsif trip_data[index][:average_rating] == highest_avg
      best_rated_driver << trip_data[index][:driver_id]
    elsif trip_data[index][:average_rating] > highest_avg
      highest_avg = trip_data[index][:average_rating]
      best_rated_driver = []
      best_rated_driver << trip_data[index][:driver_id]
    end
  end
  puts "The driver with the highest rating is #{best_rated_driver[0]}!"
  return trip_data
end


trip_data = numberRides(trip_data)
trip_data = totalEarnings(trip_data)
trip_data = averageRating(trip_data)
trip_data = highestEarner(trip_data)
trip_data = highestRating(trip_data)
