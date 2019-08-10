# stores the data for all the rides, specificall left expanded into individually lines to make it easier to read
rides = [
  {
    driver_id: "DR0004",
    date: "3rd Feb 2016",
    cost: 5,
    rider_id: "RD0022",
    rating: 5
  },
  {
    driver_id: "DR0001",
    date: "3rd Feb 2016",
    cost: 10,
    rider_id: "RD0003",
    rating: 3
  },
  {
    driver_id: "DR0002",
    date: "3rd Feb 2016",
    cost: 25,
    rider_id: "RD0073",
    rating: 5
  },
  {
    driver_id: "DR0001",
    date: "3rd Feb 2016",
    cost: 30,
    rider_id: "RD0015",
    rating: 4
  },        
  {
    driver_id: "DR0003",
    date: "4th Feb 2016",
    cost: 5,
    rider_id: "RD0066",
    rating: 5 
  },      
  {
    driver_id: "DR0004",
    date: "4th Feb 2016",
    cost: 10,
    rider_id: "RD0022",
    rating: 4
  },      
  {
    driver_id: "DR0002",
    date: "4th Feb 2016",
    cost: 15,
    rider_id: "RD0013",
    rating: 1
  },      
  {
    driver_id: "DR0003",
    date: "5th Feb 2016",
    cost: 50,
    rider_id: "RD0003",
    rating: 2
  },        
  {
    driver_id: "DR0002",
    date: "5th Feb 2016",
    cost: 35,
    rider_id: "RD0066",
    rating: 3
  },  
  {
    driver_id: "DR0004",
    date: "5th Feb 2016",
    cost: 20,
    rider_id: "RD0073",
    rating: 5
  },     
  {
    driver_id: "DR0001",
    date: "5th Feb 2016",
    cost: 45,
    rider_id: "RD0003",
    rating: 2
  },   
]

# creates a sorted master list of drivers
drivers = []
rides.each do |ride|
  drivers << ride[:driver_id]
end
drivers.uniq!.sort!

# external iterator over drivers, internal iterator over individual rides. When the driver IDs match, the count of "rides_per_driver" increases by 1. When the rides iterator has finished, it returns the total number of rides per driver, then resets the counter to "0"
rides_per_driver = 0 # this variable will work as a counter 
drivers.each do |driver|
  rides.each do |label, info|
    if label[:driver_id] == driver
      rides_per_driver += 1
    end
  end
  puts "Driver # #{driver} gave #{rides_per_driver} ride(s). "
  rides_per_driver = 0
end

# external iterator over drivers, internal iterator over individual rides. When driver IDs match, the count of "total_money_per_driver" increases by the price of each ride. When the rides iterator has finished, it returns the price of the rides per driver, then resets the counter to "0"
total_money_per_driver = [] # array will be used later in the program, it is here to piggy-back from this iteration
money_by_driver = [] # array will be used later in the program, it is here to piggy-back from this iteration
dates_match_money = [] # array will be used later in the program, it is here to piggy-back from this iteration
drivers.each do |driver|
  rides.each do |label, info|
    if label[:driver_id] == driver
      total_money_per_driver << label[:cost]
      dates_match_money << label[:date]
    end
  end
  money_by_driver << total_money_per_driver.sum
  print "Driver # #{driver} made a total of $ #{total_money_per_driver.sum}. "
  highest_day = total_money_per_driver.max
  highest_date = total_money_per_driver.index(highest_day)
  date = dates_match_money[highest_date]
  puts "Their highest earning day was #{date}." # piggy-backs in this iteration
  total_money_per_driver = []
  dates_match_money = []
  highest_day = 0
  highest_date = 0
  date = 0
end

# external iterator over drivers, internal iterator over individual rides. When driver IDs match, the count of "total_rating_score" increases by the rating for the ride and the total_rides counter increases by 1. Then the average is calculated. Then the average is displayed with 1 decimal point. * This is purely personal preference because I like "x.y" digits for rating. 
total_rating_score = 0
total_rides = 0
rates_by_driver = [] # This array will be used later in the program, it is here to piggy-back from this iteration
drivers.each do |driver|
  rides.each do |label, info|
    if label[:driver_id] == driver
      total_rating_score += label[:rating]
      total_rides += 1
    end
  end
  average_score = total_rating_score.to_f / total_rides
  rates_by_driver << average_score
  puts "Driver # #{driver}'s average rating is: #{'%.1f' % average_score }"
  total_rating_score = 0
  total_rides = 0
end

# uses synchronized arrays made earlier in the program "drivers" and "money_by_driver"
most_money = money_by_driver.max
highest_earning_driver = money_by_driver.index (most_money)
puts "Driver # #{drivers.fetch(highest_earning_driver)} earned the most money."

# Which driver has the highest average rating?
highest_rating = rates_by_driver.max
highest_rating_driver = rates_by_driver.index (highest_rating)
puts "Driver # #{drivers.fetch(highest_rating_driver)} had the highest rating."
