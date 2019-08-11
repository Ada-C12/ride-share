
ride_share = {
  DR0001: [
    {cost: 10, date: "3rd Feb 2016", rider_id: "RD0003", rating: 3}, 
    {cost: 45, date: "5th Feb 2016", rider_id: "RD0003", rating: 2}, 
    {cost: 30, date: "3rd Feb 2016", rider_id: "RD0015", rating: 4}
  ],
  DR0002: [
    {cost: 35, date: "5th Feb 2016", rider_id: "RD0066", rating: 3}, 
    {cost: 25, date: "3rd Feb 2016", rider_id: "RD0073", rating: 5}, 
    {cost: 15, date: "4th Feb 2016", rider_id: "RD0013", rating: 1}
  ],
  DR0003: [
    {cost: 50, date: "5th Feb 2016", rider_id: "RD0003", rating: 2}, 
    {cost: 5, date: "4th Feb 2016", rider_id: "RD0066", rating: 5}
  ], 
  DR0004: [
    {cost: 5, date: "3rd Feb 2016", rider_id: "RD0022", rating: 5}, 
    {cost: 20, date: "5th Feb 2016", rider_id: "RD0073", rating: 5}, 
    {cost: 10, date: "4th Feb 2016", rider_id: "RD0022", rating: 4}
  ]
}

total_rating = 0
max_cost = 0
most_cost_driver = 0
highest_rating = 0
highest_rated_driver = 0

ride_share.each do |driver, ride|
  total_cost = ride.sum { |each_ride| each_ride[:cost] }
  total_rating = ride.sum { |each_ride| each_ride[:rating] }
  puts "DRIVER ##{ driver } 
  ** gave a total of #{ ride.length } rides **
  ** made a total of $#{ total_cost } **
  ** had an average rating of #{ total_rating/ride.length.to_f } **"
  
  if total_cost > max_cost
    max_cost = total_cost
    most_cost_driver = driver
  end 
  
  if total_rating > highest_rating
    highest_rating = total_rating
    highest_rated_driver = driver
  end
end
puts "-----------------------------------------"
puts "Driver who made the most money : #{ most_cost_driver }
Driver who had the highest average rating: #{ highest_rated_driver } "
