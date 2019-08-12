# Create a ride share program:
puts "Welcome to the ride share program!"

# In this assignment, you should take data from a given CSV file and organize it into one single variable 
# that is one single nested data structure. This nested data structure should use both arrays and hashes.
total_rides = [
{:driver_id=> "DR0004",	:date=>"3rd Feb 2016",	:cost=> 5,	:rider_id=> "RD0022",	:rating=> 5},
{:driver_id=>"DR0001",	:date=> "3rd Feb 2016",	:cost=> 10,	:rider_id=> "RD0003",	:rating=> 3},
{:driver_id=> "DR0002",	:date=> "3rd Feb 2016",	:cost=> 25,	:rider_id=> "RD0073",	:rating=> 5},
{:driver_id=> "DR0001",	:date=> "3rd Feb 2016",	:cost=> 30,	:rider_id=> "RD0015",	:rating=> 4},
{:driver_id=> "DR0003",	:date=> "4th Feb 2016",	:cost=> 5,	:rider_id=> "RD0066",	:rating=> 5},
{:driver_id=> "DR0004",	:date=> "4th Feb 2016",	:cost=> 10,	:rider_id=> "RD0022",	:rating=> 4},
{:driver_id=> "DR0002",	:date=> "4th Feb 2016",	:cost=> 15,	:rider_id=> "RD0013",	:rating=> 1},
{:driver_id=> "DR0003",	:date=> "5th Feb 2016",	:cost=> 50,	:rider_id=> "RD0003",	:rating=> 2},
{:driver_id=> "DR0002",	:date=> "5th Feb 2016",	:cost=> 35,	:rider_id=> "RD0066",	:rating=> 3},
{:driver_id=> "DR0004",	:date=> "5th Feb 2016",	:cost=> 20,	:rider_id=> "RD0073",	:rating=> 5},
{:driver_id=> "DR0001",	:date=> "5th Feb 2016",	:cost=> 45,	:rider_id=> "RD0003",	:rating=> 2}]

# Iterate through the data structure to display, by printing in terminal, the following statments:
# # 1) The number of rides each driver has given.
summary_rides = []
total_rides.length.times do |name|
  summary_rides << total_rides[name][:driver_id]
end

puts "\n1)Summary of rides:"
summary_rides.sort.uniq.each do |name|
   puts "Driver #{name} has given #{summary_rides.count(name)} rides." 
end 

# Modified the original array "total_rides" in function of "drivers ids" to answer the questions. 
# P.s. Kept the initial array "total_rides" as it was originally.
by_drivers = total_rides.map(&:dup).group_by {|key| "#{key.delete(:driver_id)}".to_sym}

# # 2 - The total amount of money each driver has made.
puts "\n2) Summary of driver's profit:"
profit = by_drivers.transform_values {|value| value.reduce(0) {|sum, item| sum + item[:cost]}}
profit.sort.each do |key, value|
  puts "Driver #{key} has made $#{value}."
end 

# # 3 - the average rating for each driver.
puts "\n3) Average rating for each driver:"
rating = by_drivers.transform_values do |value|
  value.reduce(0) {|sum, item| sum + item[:rating]}
end

rating_array = []
rating.sort.each do |key, value|
  ave_rating = (value/(by_drivers[key].size).to_f)
  rating_array << ave_rating 

  puts "Driver #{key} had an average rating of #{'%.2f' % ave_rating}."
end 

# # 4 - Which driver made the most money?
profit_max = profit.select {|key, value| value == (profit.values.max)}
profit_max.each do |key, value|
  puts "\n4) Driver #{key} made the most money."
end

# # 5 - Which driver has the highest average rating?
ave_rating_total = {}
rating.sort.each do |key, value|
  ave_rating_total[key] = (value/(by_drivers[key].size).to_f)
end

rating_max = ave_rating_total.select {|key, value| value == (ave_rating_total.values.max)}
rating_max.each do |key, value|
  puts "\n5) Driver #{key} has the highest average rating."
end

puts "\n"
