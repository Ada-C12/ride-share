#step 4: Total Driver's Earnings and Number of Rides
# Use an iteration blocks to print the following answers:
# - the number of rides each driver has given
# - the total amount of money each driver has made
# - the average rating for each driver
# - Which driver made the most money?
# - Which driver has the highest average rating?
#optional--For each driver, on which day did they make the most money?

trip_data = [
   {
    id: "DR0004",
    date: ["3rd Feb 2016", "4th Feb 2016", "5th Feb 2016"],
    cost: [5, 10, 20],
    rider_id: ["RD0022", "RD0022", "RD0073"],
    rating: [5, 4, 5]
  },
  {
    id: "DR0001",
    date: ["3rd Feb 2016", "3rd Feb 2016", "5th Feb 2016"],
    cost: [10, 30, 45],
    rider_id: ["RD0003", "RD0015", "RD0003"],
    rating: [3, 4, 2]
  },
   {
    id: "DR0002",
    date: ["3rd Feb 2016", "4th Feb 2016", "5th Feb 2016"],
    cost: [25, 15, 35],
    rider_id: ["RD0073", "RD0013", "RD0066"],
    rating: [5, 1, 3]
  },
    {
    id: "DR0003",
    date: ["4th Feb 2016", "5th Feb 2016"],
    cost: [5, 50],
    rider_id: ["RD0066", "RD0003"],
    rating: [5, 2]
}
]

# -the number of rides each driver has given
 
puts "The number of rides each driver has given: "
trip_data.each do |ride|
  total_rides = ride[:date].length
  puts "-Driver ##{ride[:id]} has given #{total_rides} rides."
end

# -the total amount of money each driver has made
total_money = 0
most_money = 0
driver_name = ""

puts "\nThe total amount of money each driver has made:\n"
trip_data.each do |money|
  total_money = money[:cost].sum
  puts "-Driver ##{money[:id]} has made $#{total_money}"

# -Which driver made the most money?
  if most_money < total_money
   most_money = total_money
   driver_name = money[:id]
  end
end
  puts "\n-#{driver_name} made the most money of $#{most_money.round(2)}"

#For each driver, on which day did they make the most money?
#stackoverflow ##get the highest value in an array and its index in ruby###
puts "\nThe day for each driver make the most money: "
trip_data.each do |money|
  total_money_index = money[:cost]
  day_with_most_money = money[:date]
  max_index = total_money_index.rindex(total_money_index.max) 
   puts "-Driver ##{money[:id]} has made the most money on #{day_with_most_money[max_index]}."
end

# -the average rating for each driver
average_rating = 0
highest_average_rating = 0
driver_name = ""

puts "\nThe average rating for each driver:\n "
trip_data.each do |rating|
  total_rating = rating[:rating].sum.to_f
  average_rating = total_rating / rating[:rating].length
  puts "-The average rating for driver ##{rating[:id]} is #{average_rating.round(2)}"

# - Which driver has the highest average rating?
if highest_average_rating < average_rating
   highest_average_rating = average_rating
   driver_name = rating[:id]
  end 
end 
   puts "\n-#{driver_name} has the highest average rating of #{highest_average_rating.round(2)}"
   
