########################################################
# Step 1: Establish the layers

# In this section of the file, as a series of comments,
# create a list of the layers you identify.
# Which layers are nested in each other?
# Which layers of data "have" within it a different layer?
# Which layers are "next" to each other?

# answer:
# drivers...
#   rides...
#     date, cost, rider, rating

########################################################
# Step 2: Assign a data structure to each layer

# Copy your list from above, and in this section
# determine what data structure each layer should have

# answer:
# drivers hash contains
#   (rides) array contains
#     (ride) hash contains
#       date, cost, rider, rating


########################################################
# Step 3: Make the data structure!

# Setup the entire data structure:
# based off of the notes you have above, create the
# and manually write in data presented in rides.csv
# You should be copying and pasting the literal data
# into this data structure, such as "DR0004"
# and "3rd Feb 2016" and "RD0022"

DRIVERS = {
  DR0001: [
    { date: "3rd Feb 2016", cost: 10, rider: "RD0003", rating: 3 }, 
    { date: "3rd Feb 2016", cost: 30, rider: "RD0015", rating: 4 }, 
    { date: "5th Feb 2016", cost: 45, rider: "RD0003", rating: 2 }
  ],
  DR0002: [
    { date: "3rd Feb 2016", cost: 25, rider: "RD0073", rating: 5 },
    { date: "4th Feb 2016", cost: 15, rider: "RD0013", rating: 1 }, 
    { date: "5th Feb 2016", cost: 35, rider: "RD0066", rating: 3 }
  ],
  DR0003: [
    { date: "4th Feb 2016", cost: 5, rider: "RD0066", rating: 5 }, 
    { date: "5th Feb 2016", cost: 50, rider: "RD0003", rating: 2 },
  ],
  DR0004: [
    { date: "3rd Feb 2016" , cost: 5, rider: "RD0022", rating: 5 },
    { date: "4th Feb 2016" , cost: 10, rider: "RD0022", rating: 4 },
    { date: "5th Feb 2016" , cost: 20, rider: "RD0073", rating: 5 }
  ]
}
########################################################
# Step 4: Total Driver's Earnings and Number of Rides

# Use an iteration blocks to print the following answers:
puts "the number of rides each driver has given:"
DRIVERS.each { |driver, rides| puts "#{driver} had #{rides.count} rides" }

# sum_by: expects array of hashes and key referencing a number in each hash
# returns sum of those numbers 
def sum_by(hashes, key) 
  hashes.map { |hash| hash[key] }
        .sum
end

def earnings(rides)
  sum_by(rides, :cost)
end

puts "\nthe total amount of money each driver has made:"
DRIVERS.each do |driver, rides| 
  puts "#{ driver } earned #{ earnings(rides) }"
end

def avg_rating(rides)
  sum_by(rides, :rating) / rides.count.to_f
end

puts "\nthe average rating for each driver:"
DRIVERS.each do |driver, rides| 
  puts "#{ driver } has an average rating of #{ avg_rating(rides) }"
end

moniest = DRIVERS.max_by { |_, rides| earnings(rides) }

puts "\nWhich driver made the most money?"
puts "#{ moniest.first } made the most money"

ratest = DRIVERS.max_by { |_, rides| avg_rating(rides) }

puts "\nWhich driver has the highest average rating?"
puts "#{ ratest.first } has the highest average rating"

def earnings_by_day(rides)
  rides.group_by { |ride| ride[:date] } # -> { Date => [Ride] }
       .transform_values { |v| v = earnings(v) } # -> { Date => Integer }
       .max_by { |_, earnings| earnings }
end

puts "\nOn which day did each driver make the most money:"
DRIVERS.each do |driver, rides|
  puts "#{ driver } made the most money on: #{ earnings_by_day(rides).first }"
end
