driver_data_for_use = [
    {DR0004: {date: "3rd Feb 2016", cost: 5, rider_id: "RD0022", rating: 5}},
    {DR0001: {date: "3rd Feb 2016", cost: 10, rider_id: "RD0003", rating: 3}},
    {DR0002: {date: "3rd Feb 2016", cost: 25, rider_id: "RD0073", rating: 5}},
    {DR0001: {date: "3rd Feb 2016", cost: 30, rider_id: "RD0015", rating: 4}},
    {DR0003: {date: "4th Feb 2016", cost: 5, rider_id: "RD0066", rating: 5}},
    {DR0004: {date: "4th Feb 2016", cost: 10, rider_id: "RD0022", rating: 4}},
    {DR0002: {date: "4th Feb 2016", cost: 15, rider_id: "RD0013", rating: 1}},
    {DR0003: {date: "5th Feb 2016", cost: 50, rider_id: "RD0003", rating: 2}},
    {DR0002: {date: "5th Feb 2016", cost: 35, rider_id: "RD0066", rating: 3}},
    {DR0004: {date: "5th Feb 2016", cost: 20, rider_id: "RD0073", rating: 5}},
    {DR0001: {date: "5th Feb 2016", cost: 45, rider_id: "RD0003", rating: 2}}
]

# 1 --- the number of rides each driver has given 
driver_and_trips = {}

driver_data_for_use.each do |trip|
    trip.each do |key, value|
        if driver_and_trips.include?(key) == false
            driver_and_trips[key] = 1
        else
            driver_and_trips[key] += 1
        end 
    end
end 

driver_and_trips.each do |driver, trip|
    puts "#{driver} gave a total of #{trip} rides"
end 
driver_and_trips
puts ""

# 2 --- The total amount of money each driver has made
driver_total_pay = {}

driver_data_for_use.each do |trip|
    trip.each do |key, value|
        if driver_total_pay.include?(key) == false
            driver_total_pay[key] = trip[key][:cost]
        else
            driver_total_pay[key] += trip[key][:cost]
        end 
    end
end 

driver_total_pay.each do |driver, pay|
    puts "#{driver} had a total pay of $#{pay}"
end 
driver_total_pay
puts ""

# 3 The average rating for each driver
driver_rating_total = {}

driver_data_for_use.each do |trip|
    trip.each do |key, value|
        if driver_rating_total.include?(key) == false
            driver_rating_total[key] = trip[key][:rating]
        else
            driver_rating_total[key] += trip[key][:rating]
        end 
    end
end 

ratings_only = driver_rating_total.values
rides_only = driver_and_trips.values
drivers_only = driver_and_trips.keys

driver_avg_ratings = {}

for i in 0..drivers_only.length-1
    avg_rating = ratings_only[i].to_f/rides_only[i].to_f
    avg_rating = avg_rating.round(1)
    driver_avg_ratings[drivers_only[i]] = avg_rating
end 

driver_avg_ratings.each do |driver, rating|
    puts "#{driver} has an average rating of #{rating}"
end 
driver_avg_ratings
puts ""

# 4 Which driver made the most money?
ballin_driver = driver_total_pay.max_by{|driver, pay| pay}
puts "#{ballin_driver[0]} made the most money ($#{ballin_driver[1]}!!!)"

# 5 Which driver has the highest average rating?
best_driver_ever = driver_avg_ratings.max_by{|driver, rating| rating}
puts "#{best_driver_ever[0]} has the highest rating (#{best_driver_ever[1]}!!!)"
