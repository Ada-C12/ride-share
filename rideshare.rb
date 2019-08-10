
ride_data_by_driver= {
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
cost = 0


ride_data_by_driver.each do |driver, ride|
  puts "Driver ##{ driver } had #{ ride.length } rides."
  cost = 0
  rating = 0
  
  ride.each do |ride|
    cost += ride[:cost]
    rating += ride[:rating]
  end
  
  average_rating = rating/ride.length.to_f
  ride.push({:money_made => cost, :average_rating => average_rating})
  
  puts "Driver ##{ driver } made $#{ ride[-1][:money_made] }."
  puts "Driver ##{ driver } had an average rating of #{ ride[-1][:average_rating] }"
  puts "---------------------------------------"
end

def find_the_max_rating(hash)
  highest_rating = 0
  highest_rated_driver = ""
  hash.each do |driver, rating|
    if rating.last[:average_rating] > highest_rating
      highest_rated_driver = driver
      highest_rating = rating.last[:average_rating]
    end
  end
  return highest_rated_driver
end

def find_the_max_money_made(hash)
  most_money = 0
  driver_with_most_money = ""
  hash.each do |driver, rating|
    if rating.last[:money_made] > most_money
      driver_with_most_money = driver
      most_money = rating.last[:money_made]
    end
  end
  return driver_with_most_money
end

puts "** The highest rated driver was ##{ find_the_max_rating(ride_data_by_driver) }."
puts "** The driver who made the most money was ##{ find_the_max_money_made(ride_data_by_driver) }."




