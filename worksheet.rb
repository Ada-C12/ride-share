########################################################
# Step 1: Establish the layers

# In this section of the file, as a series of comments,
# create a list of the layers you identify.
# Which layers are nested in each other?
# Which layers of data "have" within it a different layer?
# Which layers are "next" to each other?

# Layers:
# Driver IDs
# Rider IDs
# Date of Rides
# Cost of each ride
# Rating of each ride
# Driver IDs and Rider IDs are "next" to each other
# Within the date of each ride is the cost of the ride and its rating
# But you could also think about these layers differently
# -> Dates, costs, and ratings are al "next" to each other
# -> Within each driver, is the costs, dates, ratings, and riders of all of their rides
# -> Or alternatively, within each rider, there is a set of information about all their rides

########################################################
# Step 2: Assign a data structure to each layer

# Copy your list from above, and in this section
# determine what data structure each layer should have

# Driver IDs --> Hash within a hash
# Rider IDs --> array within a hash
# Date of Rides --> array within a hash
# Cost of each ride --> array within a hash
# Rating of each ride --> array within a hash

########################################################
# Step 3: Make the data structure!

# Setup the entire data structure:
# based off of the notes you have above, create the
# and manually write in data presented in rides.csv
# You should be copying and pasting the literal data
# into this data structure, such as "DR0004"
# and "3rd Feb 2016" and "RD0022"

data_hash = {
  DR0001: {
    costs: [10, 30, 45],
    dates: ["3rd Feb 2016", "3rd Feb 2016", "5th Feb 2016"],
    riders: ["RD0003", "RD0015", "RD0003"],
    ratings: [3, 4, 2]
  },
  DR0002: {
    costs: [25, 15, 35],
    dates: ["3rd Feb 2016", "4th Feb 2016", "5th Feb 2016"],
    riders: ["RD0073", "RD0013", "RD0066"],
    ratings: [5, 1, 3]
  },
  DR0003: {
    costs: [5, 50],
    dates: ["4th Feb 2016", "5th Feb 2016"],
    riders: ["RD0066", "RD0003"],
    ratings: [5, 2]
  },
  DR0004: {
    costs: [5, 10, 20],
    dates: ["3rd Feb 2016", "4th Feb 2016", "5th Feb 2016"],
    riders: ["RD0022", "RD0022", "RD0073"],
    ratings: [5, 4, 5]
  }
}

########################################################
# Step 4: Total Driver's Earnings and Number of Rides

# Use an iteration blocks to print the following answers:
# - the number of rides each driver has given
# - the total amount of money each driver has made
# - the average rating for each driver
# - Which driver made the most money?
# - Which driver has the highest average rating?

# Define data structures
average_ratings_array = []
top_earning_drivers = []
highest_rated_drivers = []

# Define methods
# Method to store the highest-achieving drivers in given categories
def find_the_highest(array_to_compare, array_of_highest, hash)
  
  array_to_compare.each_with_index do |item, index|
    if item == array_to_compare.max
      array_of_highest << hash.keys[index]
    end
  end
  
end

# Method to print the highest-achieving drivers in given categories
def print_highest_results (array_of_highest, category_string, plural_string, singular_string)
  
  if array_of_highest.length > 1
    print "#{category_string}#{plural_string}"
    (array_of_highest.length - 1).times do |i|
      print "#{array_of_highest[i]}, "
    end
    puts "and #{array_of_highest.last}."
  else
    puts "#{category_string}#{singular_string}#{array_of_highest.first}."
  end
  
end

# - The number of rides each driver has given
data_hash.each do |driver, info|
  puts "#{driver} gave #{info[:costs].length} rides."
end

# - The total amount of money each driver has made
total_money_array = []

data_hash.each do |driver, info|
  total_money = info[:costs].sum
  puts "#{driver} made $#{total_money} total."
  total_money_array << total_money
end

# - The average rating for each driver
data_hash.each do |driver, info|
  average_rating = (info[:ratings].sum.to_f) / (info[:ratings].length.to_f)
  puts "#{driver} had an average rating of #{average_rating}."
  average_ratings_array << average_rating
end

# - Which driver made the most money?
find_the_highest(total_money_array, top_earning_drivers, data_hash)

print_highest_results(top_earning_drivers, "The top earning", " drivers were ", " driver was ")

# - Which driver has the highest average rating?
find_the_highest(average_ratings_array, highest_rated_drivers, data_hash)

print_highest_results(highest_rated_drivers, "The highest rated", " drivers were ", " driver was ")

# Optional: For each driver, on which day did they make the most money?
data_hash.each do |driver, info|
  
  highest_date = []
  third_money = 0
  fourth_money = 0
  fifth_money = 0
  
  dates_array = ["3rd Feb 2016", "4th Feb 2016", "5th Feb 2016"]
  
  info[:dates].each_with_index do |item, index|
    if item == dates_array[0]
      third_money += info[:costs][index]
    elsif item == dates_array[1]
      fourth_money += info[:costs][index]
    else
      fifth_money += info[:costs][index]
    end
  end
  
  money_days = [third_money, fourth_money, fifth_money]
  
  money_days.each_with_index do |item, index|
    if item == money_days.max
      highest_date << dates_array[index]
    end
  end
  
  print "#{driver} "
  print_highest_results(highest_date.uniq, "earned the most money on ", "", "")
  
end
