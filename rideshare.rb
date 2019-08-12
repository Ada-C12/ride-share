drivers = {
  DR0001: [
    {
      date: '02/03/2016',
      cost: 10,
      rider_ID: 'RD0003',
      rating: 3
    },
    {
      date: '02/03/2016',
      cost: 30,
      rider_ID: 'RD0015',
      rating: 4
    },
    {
      date: '02/05/2016',
      cost: 45,
      rider_ID: 'RD0003',
      rating: 2
    }
  ],
  
  DR0002: [
    {
      date: '02/03/2016',
      cost: 25,
      rider_ID: 'RD0073',
      rating: 5
    },
    {
      date: '02/04/2016',
      cost: 15,
      rider_ID: 'RD0013',
      rating: 1
    },
    {
      date: '02/05/2016',
      cost: 35,
      rider_ID: 'RD0066',
      rating: 3
    }
  ],
  
  DR0003: [
    {
      date: '02/04/2016',
      cost: 5,
      rider_ID: 'RD0066',
      rating: 5
    },
    {
      date: '02/05/2016',
      cost: 50,
      rider_ID: 'RD0003',
      rating: 2
    }
  ],
  
  DR0004: [
    {
      date: '02/03/2016',
      cost: 5,
      rider_ID: 'RD0022',
      rating: 5
    },
    {
      date: '02/04/2016',
      cost: 10,
      rider_ID: 'RD0022',
      rating: 4
    },
    {
      date: '02/05/2016',
      cost: 20,
      rider_ID: 'RD0073',
      rating: 5
    }
  ]
}

puts "TOTAL RIDES PER DRIVER:"
drivers.each_key do |driver|
  puts "Driver #{driver} has given #{drivers[driver].count} rides."
end

puts "\nTOTAL AMOUNT MADE PER DRIVER:"
mostMoney = 0
richestDriver = ""

drivers.each do |driver, rides|
  totalMoney = rides.map {|ride| ride[:cost]}.reduce (:+)
  
  puts "Driver #{driver} has made $#{totalMoney}."
  
  if totalMoney > mostMoney
    mostMoney = totalMoney
    richestDriver = driver
  end
  
end

puts "\nAVERAGE RATING PER DRIVER:"
highestAverageRating = 0
nicestDriver = ""

drivers.each do |driver, rides|
  totalRating = rides.map {|ride| ride[:rating]}.reduce(:+).to_f
  averageRating = totalRating/(drivers[driver].count)
  
  if averageRating % 1 == 0
    averageRating = averageRating.to_i
  else 
    averageRating = averageRating.round(2)
  end
  
  puts "Driver #{driver}'s average rating is #{averageRating}."
  
  if averageRating > highestAverageRating
    highestAverageRating = averageRating
    nicestDriver = driver
  end
  
end

puts "\nDriver #{richestDriver} made the most money: $#{mostMoney}."
puts "\nDriver #{nicestDriver} had the highest average rating: #{highestAverageRating}.\n\n"

puts "MOST PROFITABLE DAY PER DRIVER:"
ridesByDay = {}

drivers.each_key do |driver|
  drivers[driver].each do |ride|
    currentDate = ride[:date]
    if ridesByDay.has_key? currentDate
      ridesByDay[currentDate] += ride[:cost]
    else
      ridesByDay[currentDate] = ride[:cost]
    end
  end
  max = ridesByDay.max_by{|date, total| total}
  puts "Driver #{driver} made the most amount of money on #{max.first}: $#{max.last}."
  ridesByDay.clear
end
