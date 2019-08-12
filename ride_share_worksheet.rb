# Step 0: Understand the data we need to organize

# 1. What things (objects, nouns) are represented or described in this file? We can think of at least six different things.
# driver ID, date--day, month, year, cost, rider id, rating

# 2. From the things you listed in the previous question, all of those things have relationships to each other. (an ID belongs to a person, for instance. As an abstract, unrelated example a VIN belongs to a vehicle, and a vehicle has a VIN.) Consider the relationships between the pieces of data.
#  driver ID --> driver; date --> when the ride happened; cost --> the value of the ride related to distance, rate and tip; rider id --> rider; rating --> the quality of the trip
# driver --> rating, date, cost, rider
# rider --> driver, rating, date, cost

# 3. Lastly, in this assignment, we will rearrange all of the data into one data structure (with a lot of nested layers), that can be held in one variable. List some ideas: considering all of the relationships listed in the last question, what piece of data can contain the others at the top-most level? (Compared to the json example before, think about what the top-most layer of the hash and what that represented.) There is more than one correct answer, so just list out the options at this moment.

# a)organizing around riders: A hash with rider IDs as the keys, with the value pairs as arrays of hashes of the rest of the information

# b)organizing around drivers: A hash with driver IDs as the keys, with the value pairs as arrays of hashes of the rest of the information

# c)organizing around trips as an array, with the rest of the information nested within hashes:
# trips = [
#   {
#     driver_id: "DR0004",
#     date: "3rd Feb 2016",
#     cost: 5,
#     rider_id: "RD0022",
#     rating: 5
#   },
#   {
#     driver_id: "DR0001",
#     date: "3rd Feb 2016",
#     cost: 10,
#     rider_id: "RD0003",
#     rating: 3
#   }
# ]

# d)organizing around dates as a hash, with each date representing the key
# dates = {
#   "3rd Feb 2016" => [
#     {
#     driver_id: "DR0004",
#     cost: 5,
#     rider_id: "RD0022",
#     rating: 5
#     },
#     {
#     driver_id: "DR0001",
#     cost: 10,
#     rider_id: "RD0003",
#     rating: 3
#     }
#   ]
# }


########################################################
# Step 1: Establish the layers

# In this section of the file, as a series of comments,
# create a list of the layers you identify.
# Drivers: with rating, riders, cost, and date nested underneath

# Which layers are nested in each other?
# hash of drivers, with each driver id as the key, with a value pair that is an array of all of the hashes of the rest of the info for each ride that driver id has completed

# Which layers of data "have" within it a different layer?
# the drivers contain the rest of the information nested in it

# Which layers are "next" to each other?
# the date, cost, rider_id, and rating are next to each other within a hash

########################################################
# Step 2: Assign a data structure to each layer

# Copy your list from above, and in this section
# determine what data structure each layer should have

# A hash with driver IDs as the keys, with the value pairs as arrays of hashes of the date, cost, rider_id, and rating

########################################################
# Step 3: Make the data structure!

# Setup the entire data structure:
# based off of the notes you have above, create the
# and manually write in data presented in rides.csv
# You should be copying and pasting the literal data
# into this data structure, such as "DR0004"
# and "3rd Feb 2016" and "RD0022"

drivers = {
  DR0001: [
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
  DR0002: [
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
  DR0003: [
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
  DR0004: [
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

########################################################
# Step 4: Total Driver's Earnings and Number of Rides
# Use an iteration blocks to print the following answers:


puts "1. - The number of rides each driver has given"

drivers.each do |driver, array|
  puts "Driver #{driver} has given #{array.length} total rides."
end


puts "2. - The total amount of money each driver has made"

drivers.each do |driver, array|
  profit = array.reduce(0) { |sum, hash| sum + hash[:cost]  }
  puts "Driver #{driver} has made $#{profit} total."
end


puts "3. - The average rating for each driver"

drivers.each do |driver, array|
  total = array.reduce(0.0) { |sum, hash| sum + hash[:rating]  }
  average = total / array.length
  puts "Driver #{driver} has an average rating of #{average}."
end


puts "4. - Which driver made the most money?"

most_money = {}
drivers.each do |driver, array|
  profit = array.reduce(0) { |sum, hash| sum + hash[:cost]  }

  # create hash with Driver ID as key paired with the profit as value
  most_money[driver] = profit
end

# print key of most_money max value
puts "Driver #{most_money.key(most_money.values.max)} made the most money."


puts "5. - Which driver has the highest average rating?"

highest_average = {}
drivers.each do |driver, array|
  total = array.reduce(0.0) { |sum, hash| sum + hash[:rating]  }
  average = total / array.length

  highest_average[driver] = average
end

puts "Driver #{highest_average.key(highest_average.values.max)} has the highest average rating."


puts "6. - For each driver, on which day did they make the most money?"

drivers.each do |driver, array|
  # save hash that made the most money for driver id to most_money variable
  most_money = array.max_by { |hash| hash[:cost] }
  puts "Driver #{driver} made the most money on #{most_money[:date]}."
end
