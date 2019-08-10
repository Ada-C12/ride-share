#Initalizing Ride Share Data
rideshare_data = [
  {
    driver_id: "DR0001",
    ride_info: [
      { date: "3rd Feb 2016", cost: 10, rider_id: "RD0003", rating: 3},
      { date: "3rd Feb 2016", cost: 30, rider_id: "RD0015", rating: 4},
      { date: "5th Feb 2016", cost: 45, rider_id: "RD0003", rating: 2}
    ]
  },
  {
    driver_id: "DR0002",
    ride_info: [
      { date: "3rd Feb 2016", cost: 25, rider_id: "RD0073", rating: 5},
      { date: "4th Feb 2016", cost: 15, rider_id: "RD0013", rating: 1},
      { date: "5th Feb 2016", cost: 35, rider_id: "RD0066", rating: 3}
    ]
  },
  {
    driver_id: "DR0003",
    ride_info: [
      { date: "4th Feb 2016", cost: 5, rider_id: "RD0066", rating: 5},
      { date: "5th Feb 2016", cost: 50, rider_id: "RD0003", rating: 2}
    ]
  },   
  {
    driver_id: "DR0004",
    ride_info: [
      { date: "3rd Feb 2016", cost: 5, rider_id: "RD0022", rating: 5 },
      { date: "4th Feb 2016", cost: 10, rider_id: "RD0022", rating: 4},
      { date: "5th Feb 2016", cost: 20, rider_id: "RD0073", rating: 5}
    ]
  },
]

#Data Transformation Methods
def driver_totals (data)
  driver_earnings = []
  data.each do |x|
    ride_count = 0
    total_earnings = 0
    total_ratings = 0
    max_ride = 0
    x[:ride_info].each do |y|
      if y[:cost] > max_ride
        max_ride = y[:cost]
      end
      ride_count = ride_count +1
      total_earnings = total_earnings + y[:cost]
      total_ratings = total_ratings + y[:rating]
    end
    driver_earnings.push({driver: x[:driver_id], count: ride_count, earnings: total_earnings, avg_rating: (total_ratings.to_f/ride_count.to_f).round(1)})
  end
  return driver_earnings
end

def top_drivers (data)
  top_performing = []
  max_earned = 0
  max_rated = 0
  data.each do |x|
    if x[:earnings] > max_earned
      max_earned = x[:earnings]
      top_performing[0] = {type: "Top Earner", driver: x[:driver], amount: "$#{x[:earnings]}"}
    end
    if x[:avg_rating] > max_rated
      max_rated = x[:avg_rating]
      top_performing[1] = {type: "Top Rating", driver: x[:driver], amount: x[:avg_rating]}
    end
  end
  return top_performing
end

def driver_top_day (data)
  driver_max = []
  data.each do |x|
    max_ride = 0
    top_date = ""
    x[:ride_info].each do |y|
      if y[:cost] > max_ride
        max_ride = y[:cost]
        top_date = y[:date].to_s
      end
    end
    driver_max.push({driver: x[:driver_id], top_day: max_ride, date: top_date.to_s})
  end
  return driver_max
end

#Data Print Methods
def print_data (dataset)
  dataset.each do |x|
    print "Driver ID: #{x[:driver]}    Total Rides: #{x[:count]}   Total Earnings: $#{x[:earnings]}   Average Rating: #{x[:avg_rating]}\n"
  end
end

def print_top_data (dataset)
  dataset.each do |x|
    print "#{x[:type]}:    Driver ID: #{x[:driver]}   Amount: #{x[:amount]}\n"
  end
end

def print_top_days (dataset)
  dataset.each do |x|
    print "Driver ID: #{x[:driver]}   Amount: $#{x[:top_day]}    Date: #{x[:date]}\n"
  end
end

#Data Transformations
driver_data = driver_totals(rideshare_data)
top_data = top_drivers(driver_data)
max_days = driver_top_day(rideshare_data)

#Print Driver Information to Terminal
puts "Rideshare Driver Information:"
print_data(driver_data)

#Print Top Driver Information to Terminal
puts "\nTop Driver Information:"
print_top_data(top_data)

#Print Driver Max Days
puts "\nDriver Max Days:"
print_top_days(max_days)
