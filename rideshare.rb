# Driver Centric Program:

#I have an array of hashes that include hashes within the array.
#used this strategy so I don't have to repeat driver_id's
drivers = [
    {
        driver_id: "DR0001",
        cost: [10,30,45],
        rating: [3,4,2],
        rider_id:["RD0003","RD0015","RD0003"],
        date:[{month:2, day:3, year:2016},{month:2 , day:3, year:2016},{month:2 , day:5, year:2016}]
    },
    {
        driver_id:"DR0002",
        cost:[25,15,35],
        rating:[5,1,3],
        rider_id:["RD0073","RD0013","RD0066"],
        date:[{month:2, day:3, year:2016},{month:2, day:4, year:2016},{month:2 , day:5, year:2016 }] 
    },
    {
        driver_id:"DR0003",
        cost:[5,50],
        rating:[5,2],
        rider_id:["RD0066","RD0003"],
        date:[{month:2, day:4, year:2016 },{month:2, day:5, year:2016}]
    },
    {
        driver_id:"DR0004",
        cost:[5,35],
        rating:[5,3],
        rider_id:["RD0022","RD0066"],
        date:[{month:2, day:3, year:2016 },{month:2, day:5, year:2016}]
    }  
]

# The number of rides given by each driver
drivers.each do |driverinfo|
    puts "#{drivers_name = driverinfo[:driver_id]} #{driverinfo[:cost].length}"
end

#The total amount of money each driver has made using method

def get_profit(drivers)
    drivers_profit = []
    drivers.each do |driverinfo|
        money_made = driverinfo[:cost].sum
        drivers_profit.push(money_made)
        puts " Driver with ID: #{driverinfo[:driver_id]} : made $#{money_made} profit total" 
    end
    return drivers_profit
end

drivers_profit = get_profit(drivers)


#Which driver has the highest average rating?

drivers_average_ratings = []
drivers.each do |driversinfo|
    rating = driversinfo[:rating].sum
    num_rides = driversinfo[:rating].length
    avg = (rating/num_rides)
    drivers_average_ratings.push(avg)
end
highest_rating = drivers_average_ratings.max
highest_index_pos = drivers_average_ratings.index(highest_rating)
puts highest_index_pos
p highest_index_pos

winner = drivers[highest_index_pos][:driver_id] 
puts "Driver with highest rating was driver: #{winner}"
