rides = [
  {
    driver_id: 'DR0004',
    date: '3rd Feb 2016',
    cost: '5',
    rating: '5',
    rider_id: 'RD0022', 
  },
  {
    driver_id: 'DR0001',
    date: '3rd Feb 2016',
    cost: '10',
    rating: '3',
    rider_id: 'RD0003',
  },
  {
    driver_id: 'DR0002',
    date: '3rd Feb 2016',
    cost: '25',
    rating: '5',
    rider_id: 'RD0073'
  },
  {
    driver_id: 'DR0001',
    date: '3rd Feb 2016',
    cost: '30',
    rating: '4',
    rider_id: 'RD0015'
  },
  {
    driver_id: 'DR0003',
    date: '4th Feb 2016',
    cost: '5',
    rating: '5',
    rider_id: 'RD0066'
  },
  {
    driver_id: 'DR0004',
    date: '4th Feb 2016',
    cost: '10',
    rating: '4',
    rider_id: 'RD0022'
  },
  {
    driver_id: 'DR0002',
    date: '4th Feb 2016',
    cost: '15',
    rating: '1',
    rider_id: 'RD0013'
  },
  {
    driver_id: 'DR0003',
    date: '5th Feb 2016',
    cost: '50',
    rating: '2',
    rider_id: 'RD0003'
  },
  {
    driver_id: 'DR0002',
    date: '5th Feb 2016',
    cost: '35',
    rating: '3',
    rider_id: 'RD0066'
  },
  {
    driver_id: 'DR0004',
    date: '5th Feb 2016',
    cost: '20',
    rating: '5',
    rider_id: 'RD0073'
  },
  {
    driver_id: 'DR0001',
    date: '5th Feb 2016',
    cost: '45',
    rating: '2',
    rider_id: 'RD0003'
  }
]

driver_ids = ["DR0001", "DR0002", "DR0003", "DR0004"]

# Question 1: The number of rides each driver has given?
def driver_ride_count(driver_id, rides)
  driver_rides = rides.select { |ride|  ride [:driver_id] == driver_id  }
  total_num_rides_for_driver = driver_rides.length
  puts "Problem 1: #{driver_id}: #{total_num_rides_for_driver} rides"
end

driver_ids.each do |id|
  driver_ride_count(id, rides)
end

# Question 2: The total amount of money each driver has made?
def driver_money_made(driver_id, rides)
  driver_rides = rides.select { |ride|  ride [:driver_id] == driver_id  }
  total_cost_for_driver = driver_rides.sum {|ride| ride [:cost].to_i }
  puts "Problem 2: $#{total_cost_for_driver} was made by Driver #{driver_id}"
end

driver_ids.each do |id|
  driver_money_made(id, rides)
end

# Question 3: The average rating for each driver?
def driver_average_rating(driver_id, rides)
  driver_rides = rides.select { |ride|  ride [:driver_id] == driver_id  }
  sum_rating_per_driver = driver_rides.sum {|ride| ride [:rating].to_f }
  total_num_rides_for_driver =  driver_rides.length 
  puts "Problem 3: #{driver_id}'s average rating: #{sum_rating_per_driver / total_num_rides_for_driver}"
end

driver_ids.each do |id|
  driver_average_rating(id, rides)
end

# Question 4: Which driver made the most money?
def driver_money_made(driver_id, rides)
  driver_rides = rides.select { |ride|  ride [:driver_id] == driver_id  }
  total_cost_for_driver = driver_rides.sum {|ride| ride [:cost].to_i }
  return total_cost_for_driver
end

drivers_income = driver_ids.map do |driver_id|
  driver_money_made(driver_id, rides)
end

max_income = drivers_income.max()
index_of_max = drivers_income.find_index(max_income)
puts "Problem 4: #{driver_ids[index_of_max]} made the most money"

# Question 5: Which driver has the highest average rating? 
def driver_average_rating(driver_id, rides)
  driver_rides = rides.select { |ride|  ride [:driver_id] == driver_id  }
  sum_rating_per_driver = driver_rides.sum {|ride| ride [:rating].to_f }
  total_num_rides_for_driver =  driver_rides.length 
  return sum_rating_per_driver / total_num_rides_for_driver
end

rating_of_drivers = driver_ids.map do |driver_id|
  driver_average_rating(driver_id, rides)
end

max_rating = rating_of_drivers.max()
index_of_max = rating_of_drivers.find_index(max_rating)
puts "Problem 5: #{driver_ids[index_of_max]} had the highest average rating"
