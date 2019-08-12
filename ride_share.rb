def main()
  drivers = 
  {
    DR0004: [
      {
        date: "3rd Feb 2016",
        cost: 5,
        rider: "RD0022",
        rating: 5
      },
      {
        date: "4th Feb 2016",
        cost: 10,
        rider: "RD0022",
        rating: 4
      },
      {
        date: "5th Feb 2016",
        cost: 20,
        rider: "RD0073",
        rating: 5
      }
    ],   
    DR0001: [
      {
        date: "3rd Feb 2016",
        cost: 10,
        rider: "RD0003",
        rating: 3
      },
      {
        date: "3rd Feb 2016",
        cost: 30,
        rider: "RD0015",
        rating: 4
      },
      {
        date: "5th Feb 2016",
        cost: 45,
        rider: "RD0003",
        rating: 2
      }
    ],
    DR0002: [
      {
        date: "3rd Feb 2016",
        cost: 25,
        rider: "RD0073",
        rating: 5
      },
      {
        date: "4th Feb 2016",
        cost: 15,
        rider: "RD0013",
        rating: 1
      },
      {
        date: "5th Feb 2016",
        cost: 35,
        rider: "RD0066",
        rating: 3
      }
    ],
    DR0003: [
      {
        date: "4th Feb 2016",
        cost: 5,
        rider: "RD0066",
        rating: 5
      },
      {
        date: "5th Feb 2016",
        cost: 50,
        rider: "RD0003",
        rating: 2
      }
    ] 
  }
  
  highest_earning = 0
  highest_average_rating = 0
  richest_driver = nil
  favorite_driver = nil
  
  drivers.each do |driver, trips|  
    # for each of driver, get an array of ratings for all their trips
    ratings = trips.map { |trip| trip[:rating] } 
    # for each of driver, get an array of cost for all their trips
    earnings = trips.map { |trip| trip[:cost] }
    
    total_earning = earnings.sum   
    average_rating = ratings.sum / trips.length    
    puts "Driver #{driver.to_s} earned $#{total_earning} over #{trips.length} trips, average rating: #{average_rating}"
    
    # find richest_driver
    if highest_earning < total_earning
      highest_earning = total_earning
      richest_driver = driver.to_s
    end
    
    # find favorite_driver
    if highest_average_rating < average_rating
      highest_average_rating = average_rating
      favorite_driver = driver.to_s
    end  
    
    # for each driver, iterate through trips, return hash of {date: earning_each_day}
    date_and_earnings = {}
    trips.each do |trip|
      if date_and_earnings.has_key? trip[:date]
        date_and_earnings[trip[:date]] += trip[:cost]
      else
        date_and_earnings[trip[:date]] = trip[:cost]
      end
    end  
    date_made_most_money = date_and_earnings.max[0]   
    puts "Driver #{driver.to_s} made the most money on #{date_made_most_money}"
  end
  
  puts "\nThe richest driver: #{richest_driver}"
  puts "The highest rating driver: #{favorite_driver}"
end

main()
