# Ride Share Program Using Array and Hashes
# Ada Cohort 12 - Week 1 - August 11, 2019
# Author: Farah Davoodi
# This program will evaluate ride share data and answer specific questions

# Data organized into hash, ride-share with each driver ID as the key
ride_share =  
{
    DR0001: [
        {
            date: "Feb 03, 2016",
            cost: 10,
            rider_id: "RD0003",
            rating: 3
        }, 
        {
            date: "Feb 03, 2016",
            cost: 30,
            rider_id: "RD00015",
            rating: 4
        },
        {
            date: "Feb 05, 2016",
            cost: 45,
            rider_id: "RD0003",
            rating: 2
        }
    ]
},
{
    DR0002: [
        {
            date: "Feb 03 2016",
            cost: 25,
            rider_id: "RD0073",
            rating: 5
        },
        {
            date: "Feb 04, 2016",
            cost: 15,
            rider_id: "RD0013",
            rating: 1
        },
        {
            date: "Feb 05, 2016",
            cost: 35,
            rider_id: "RD0066",
            rating: 3
        }
    ]
},
{
    DR0003: [
        {
            date: "Feb 04, 2016",
            cost: 5,
            rider_id: "RD0066",
            rating: 5
        },
        {
            date: "Feb 05, 2016",
            cost: 50,
            rider_id: "RD0003",
            rating: 5
        }
    ]
},
{
    DR0004: [
        {
            date: "Feb 03 2016",
            cost: 5,
            rider_id: "RD0022",
            rating: 5
        },
        {
            date: "Feb 04, 2016",
            cost: 10,
            rider_id: "RD0022",
            rating: 4
        },
        {
            date: "Feb 05, 2016",
            cost: 20,
            rider_id: "RD0073",
            rating: 5
        }
    ]
}

# Question 1
# The number of rides each driver has given
puts "Calculating how many rides each driver has given..."
ride_share.each do |driver|
    driver.each do |driver_id, rides|
        puts "Driver #{driver_id} has given #{rides.count} rides."
    end
end
puts

# Question 2
# The total amount of money each driver has made
puts "Calculating total amount of money each driver has made..."
ride_share.each do |driver|
    driver.each do |driver_id, rides|
        cost = 0
        rides.each do |trip|
            cost = cost + (trip[:cost])
        end
        puts "Driver #{driver_id} has made a total cost of $#{cost}."
    end
end
puts

# Question 3
# The average rating for each driver
puts "Calculating average driver rating..."
ride_share.each do |driver|
    driver.each do |driver_id, rides|
        average_rating = []
        rides.each do |trip|
            average_rating.push(trip[:rating])
        end
        driver_avg = ((average_rating.sum)/(average_rating.length).to_f)
        puts "Driver #{driver_id} has an average rating of #{driver_avg}."
    end
end
puts

# Question 4
# Which driver made the most money?
puts "Calculating which driver has made the most money..."
max_cost = 0
max_driver = ""
ride_share.each do |driver|
    driver.each do |driver_id, rides|
        cost = 0
        rides.each do |trip|
            cost = cost + (trip[:cost])
        end
        
        if cost > max_cost
            max_cost = cost
            max_driver = driver_id
        end
    end
end
puts "Driver #{max_driver} made the most money with $#{max_cost}."
puts

# Question 5
# Which driver has the highest average rating?
puts "Calculating which driver has the highest average rating..."
highest_rating = 0
highest_rated_driver = ""
ride_share.each do |driver|
    driver.each do |driver_id, rides|
        average_rating = []
        rides.each do |trip|
            average_rating.push(trip[:rating])
        end
        driver_avg = ((average_rating.sum)/(average_rating.length)).to_f
        
        if driver_avg > highest_rating
            highest_rating = driver_avg
            highest_rated_driver = driver_id
        end
    end
end
puts "The driver with the highest average rating was #{highest_rated_driver} with an average rating of #{highest_rating}."
puts

# Optional Question 6
# For each driver, on which day did they make the most money?
puts "Calculating the day each driver made the most money..."
ride_share.each do |driver|
    driver.each do |driver_id, rides|
        max_made = 0
        max_day = ""
        rides.each do |trip|
            if  trip[:cost] > 0
                max_made = trip[:cost]
                max_day = trip[:date]
            end
        end
        puts "Driver #{driver_id} made the most money with $#{max_made} on #{max_day}."
    end
end
