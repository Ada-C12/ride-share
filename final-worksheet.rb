#hashes with key of driver's ID and value of an array of hashes. 
#Each hash contains the information of a single ride the driver did.
drivers = {
  dr0001: [
    {
      date: "3rd Feb 2016",
      cost: 10,
      rider_id: "RD0003",
      rating: 3
    },
    {
      date: "3rd Feb 2016",
      cost: 30,
      rider_id: "RD0015",
      rating: 4
    },
    {
      date: "5th Feb 2016",
      cost: 45,
      rider_id: "RD0003",
      rating: 2
    }
  ],
  dr0002: [
    {
      date: "3rd Feb 2016",
      cost: 25,
      rider_id: "RD0073",
      rating: 5
    },
    {
      date: "4th Feb 2016",
      cost: 15,
      rider_id: "RD0013",
      rating: 1
    },
    {
      date: "5th Feb 2016",
      cost: 35,
      rider_id: "RD0066",
      rating: 3
    }
  ],
  dr0003: [
    {
      date: "4th Feb 2016",
      cost: 5,
      rider_id: "RD0066",
      rating: 5
    },
    {
      date: "5th Feb 2016",
      cost: 50,
      rider_id: "RD0003",
      rating: 2
    }
  ],
  dr0004: [ 
    { 
      date: "3rd Feb 2016",
      cost: 5,
      rider_id: "RD0022",
      rating: 5
    },
    {
      date: "4th Feb 2016",
      cost: 10,
      rider_id: "RD0022",
      rating: 4
    },
    {
      date: "5th Feb 2016",
      cost: 20,
      rider_id: "RD0073",
      rating: 5
    }
  ]
}

most_profit_array = []
average_rating_array = []

# - the number of rides each driver has given
drivers.each do |key, value|
  rides = value.length
  print "Driver #{key} gave #{rides} rides,"
  
  # - the total amount of money each driver has made
  profit_array = []
  value.each do |hash|
    profit = hash[:cost]
    profit_array.push(profit)
  end
  print " made $#{profit_array.sum},"
  most_profit_array.push(profit_array.sum)
  
  # - the average rating for each driver
  rating_array = []
  value.each do |hash|
    driver_rating = hash[:rating]
    rating_array.push(driver_rating.to_f) 
  end
  rating_average = (rating_array.sum)/rating_array.length 
  puts " and has an average rating of #{rating_average}."
  average_rating_array.push(rating_average)
end



most_money_driver = most_profit_array.max

highest_average_rating = average_rating_array.max


drivers.each do |key, value|
  # - Which driver made the most money?
  profit_array = []
  value.each do |hash|
    profit = hash[:cost]
    profit_array.push(profit)
    profit_sum = profit_array.sum
    if profit_sum == most_money_driver
      puts "Driver #{key} made the most money."
    end
  end
  
  
  # - Which driver has the highest average rating?
  rating_array = []
  value.each do |hash|
    driver_rating = hash[:rating]
    rating_array.push(driver_rating.to_f) 
  end
  rating_average = (rating_array.sum)/rating_array.length 
  if rating_average == highest_average_rating
    puts "Driver #{key} has the highest average rating."
  end
end

