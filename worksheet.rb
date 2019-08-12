########################################################
# Step 1: Establish the layers

# In this section of the file, as a series of comments,

# create a list of the layers you identify.
# array and hash

# Which layers are nested in each other?
# array nested to hash 

# Which layers of data "have" within it a different layer?
# array has an hash in it and hash has array within it

# Which layers are "next" to each other?
# array is next to hash, then hash is next to the array

########################################################
# Step 2: Assign a data structure to each layer

# Copy your list from above, and in this section
# determine what data structure each layer should have

#array and hash
# array nested to hash 
# array has an hash in it and hash has array within it
# array is next to hash, then hash is next to the array


########################################################
# Step 3: Make the data structure!

# Setup the entire data structure:
# based off of the notes you have above, create the
# and manually write in data presented in rides.csv
# You should be copying and pasting the literal data
# into this data structure, such as "DR0004"
# and "3rd Feb 2016" and "RD0022"

########################################################
# Step 4: Total Driver's Earnings and Number of Rides

# Use an iteration blocks to print the following answers:
# - the number of rides each driver has given
# - the total amount of money each driver has made
# - the average rating for each driver
# - Which driver made the most money?
# - Which driver has the highest average rating?

# creates an array of hashes
drivers_info = [
  {
  driver_id: "DR0001",
  rides: [
    {
      rider_id: "RD0003",
      date: "3rd Feb 2016",
      cost: 10,
      rating: 3.0
    },
    {
      rider_id: "RD0015",
      date: "3rd Feb 2016",
      cost: 30,
      rating: 4.0
    },
    {
      rider_id: "RD0003",
      date: "5th Feb 2016",
      cost: 40,
      rating: 2.0
    }
  ]
},
{
  driver_id: "DR0002",
  rides: [
    {
      rider_id: "RD0073",
      date: "3rd Feb 2016",
      cost: 25,
      rating: 5.0
    },
    {
      rider_id: "RD0013",
      date: "4th Feb 2016",
      cost: 15,
      rating: 1.0
    },
    {
      rider_id: "RD0066",
      date: "5th Feb 2016",
      cost: 35,
      rating: 3.0
    }
  ]
},
{
  driver_id: "DR0003",
  rides: [
    {
    rider_id: "RD0066",
    date: "4th Feb 2016",
    cost: 5,
    rating: 5.0
    },
    {
      rider_id: "RD0003",
      date: "5th Feb 2016",
      cost: 50,
      rating: 2.0
    },
    {
      rider_id: "RD0022",
      date: "3rd Feb 2016",
      cost: 5,
      rating: 5.0
    }
  ]
}, 
  {
    driver_id: "DR0004",
    rides: [
      {
        rider_id: "RD0022",
        date: "4th Feb 2016",
        cost: 10,
        rating: 4.0
      },
      {
        rider_id: "RD0073",
        date: "5th Feb 2016",
        cost: 20,
        rating: 5.0
      }
    ]
  }
]
  
  # initialize the variable
  max = 0
  max_driver = 0
  highest_average_rating = 0
  highest_average_driver = 0
  
  # finds the number of rides each driver has given
  drivers_info.each do |driver|
      total_rides = driver[:rides].length
      puts "Total rides for driver #{driver[:driver_id]} are #{total_rides}."
  
      # finds the total amount of money each driver has made
      total_money = 0
     
      rating_sum = 0
      driver[:rides].each do |ride|
        total_money += ride[:cost] 
        rating_sum += ride[:rating]
      end
        puts "Total money for driver #{driver[:driver_id]} are #{total_money}."
  
      # finds which driver made the most money?
      if total_money > max
        max = total_money
        max_driver = driver[:driver_id]
      end

      # finds the average rating for each driver
      average =  rating_sum / driver[:rides].length
      puts "Total average for driver #{driver[:driver_id]} are #{average}."
      
      # finds Which driver has the highest average rating?
      if average > highest_average_rating
        highest_average_rating = average
        highest_average_driver = driver[:driver_id]
      end  
      
  end
  puts
  
  # prints the number of driver with the maximum amount
  puts "Driver #{max_driver} made the most money with #{max} amount."
  # prints the number of driver with the highest average rating
  puts "Driver #{highest_average_driver} has the highest average rating of #{highest_average_rating }."
