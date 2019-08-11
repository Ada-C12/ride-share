=begin 
Initialize ride data. Data structure is a hash 
containing driver_ids as keys and an array containing 
rides as its value. Each value in the array
contains a hash of the ride information.
=end
ride_data =
  {
    DR0001: [
      {
        Date: "3rd Feb 2016",
        Cost: 10,
        Rider_id: "RD0003",
        Rating: 3,
      },
      {
        Date: "3rd Feb 2016",
        Cost: 30,
        Rider_id: "RD0003",
        Rating: 4,
      },
      {
        Date: "5th Feb 2016",
        Cost: 45,
        Rider_id: "RD0003",
        Rating: 2,
      },
    ],
    DR0002: [
      {
        Date: "3rd Feb 2016",
        Cost: 25,
        Rider_id: "RD0073",
        Rating: 5,
      },
      {
        Date: "4th Feb 2016",
        Cost: 15,
        Rider_id: "RD0013",
        Rating: 1,
      },
      {
        Date: "5th Feb 2016",
        Cost: 35,
        Rider_id: "RD0066",
        Rating: 3,
      },
    ],
    DR0003: [
      {
        Date: "4th Feb 2016",
        Cost: 5,
        Rider_id: "RD0066",
        Rating: 5,
      },
      {
        Date: "5th Feb 2016",
        Cost: 50,
        Rider_id: "RD0003",
        Rating: 2,
      },
    ],
    DR0004: [
      {
        Date: "3rd Feb 2016",
        Cost: 5,
        Rider_id: "RD0023",
        Rating: 5,
      },
      {
        Date: "4th Feb 2016",
        Cost: 10,
        Rider_id: "RD0022",
        Rating: 4,
      },
      {
        Date: "5th Feb 2016",
        Cost: 20,
        Rider_id: "RD0073",
        Rating: 5,
      },
    ],
  }

# Initialize variables for use within each loop
current_max = 0
current_max_driver = ""
current_max_rating = 0
current_max_rating_driver = ""

# Iterate through the each driver id (key to hash) to count how many hashes
# are within it's array to determine the number of rides they've given and print
# the statement
puts "Driver information: \n \n"

ride_data.each do |driver_id, ride_array|
  puts "#{driver_id} gave #{ride_array.count} rides."

  # Initialize  cost and rating array to hold costs and ratingss
  # of each driver ride then access cost and rating values to push to the arrays
  rating_array = []
  cost_array = []
  ride_array.each do |ride|
    cost_array.push(ride[:Cost])
    rating_array.push(ride[:Rating])
  end

  # Sum each  cost array to get each driver's total earnings
  puts "Total earnings: $#{cost_array.sum}"

  # Use max cost index from cost array to access the date with the highest earning.
  highest_earning_index = cost_array.index(cost_array.max)
  highest_earning_day = ride_array[highest_earning_index][:Date]
  puts "Highest earning day: #{highest_earning_day}"

  # Sum rating array and divide it by the array length to determine
  # each driver's average rating and print formatted
  average_rating = ((rating_array.sum.to_f) / rating_array.count.to_f)
  puts "Average rating: #{sprintf("%.2f", average_rating)} \n \n"

  # Use previously instantiated max variables with the sum of  cost_array
  # to determine which driver made the most money
  if cost_array.sum > current_max
    current_max = cost_array.sum
    current_max_driver = driver_id
  end

  # Use previously instantiated max rating variables and average rating to determine
  # which driver had the highest average rating
  if average_rating > current_max_rating
    current_max_rating = average_rating
    current_max_rating_driver = driver_id
  end
end

# Print the driver who made the most money and the driver with the highest rating
puts "#{current_max_driver} made the most money with a total of $#{current_max}."
puts "#{current_max_rating_driver} had the highest average rating at #{sprintf("%.2f", current_max_rating)} stars!"
