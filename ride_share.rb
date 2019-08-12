drivers = {
	
	DR0001: {
		date: ["3rd Feb 2016","3rd Feb 2016","5th Feb 2016"],
		cost: [10,30,45], 
		rider_id: ["RD0003","RD0015","RD0003"],
		rating: [3.0,4.0,2.0]
		
	},
	DR0002: {
		date: ["3rd Feb 2016","4th Feb 2016","5th Feb 2016"],
		cost:[25,15,35],
		rider_id:["RD0073","RD0013","RD0066"],
		rating: [5.0,1.0,3.0],
		
	},
	DR0003: {
		date: ["4th Feb 2016","5th Feb 2016"],
		cost: [5,50],
		rider_id:["RD0066","RD0003"],
		rating: [5.0,2.0]
		
	},
	DR0004: {
		date: ["3rd Feb 2016","4th Feb 2016","5th Feb 2016"],
		cost: [5,10,20],
		rider_id: ["RD0022","RD0022","RD0073"],
		rating: [5.0,4.0,5.0]
	},
	
	
}


drivers_profit = {}
drivers_avg_rating = {}
drivers.each do |driver, data|
	
	# calculating total amount of money earned for each driver 
	driver_total = data[:cost].sum
  
	# calculating average rating for each driver 
	avg_rating = data[:rating].sum / data[:rating].length 
	
	
	drivers_profit[driver] = driver_total
	drivers_avg_rating[driver] = avg_rating 
  
	# display number of rides the driver has given, average rating, and the total profit 
	puts "Driver #{driver} gave #{data[:date].length} rides and made $#{driver_total}."
	puts "The average rating for #{driver} is #{"%.2f" % avg_rating}."
	
end  
# calculating the driver that made the most money 
max_driver = drivers_profit.max_by {|driver,profit| profit}

# calculating the driver with the highest rating 
best_driver = drivers_avg_rating.max_by {|driver, rating| rating}

# display the driver that made the most money and the driver that has the highest rating 
puts "The Driver that earned the most money is #{max_driver[0].to_s} and they earned $#{max_driver[1]}."
puts "The Driver that has the highest rating is #{best_driver[0]} with a rating of #{"%.2f" % best_driver[1]}."

# display which day each driver made the most money 
drivers.each do |driver, data|
	hash_dates = {}
	data[:date].zip(data[:cost]).each do |ride|
		if hash_dates.key?(ride[0])
			hash_dates[ride[0]] = [hash_dates[ride[0]]]
			hash_dates[ride[0]] << ride[1]
			hash_dates[ride[0]] = hash_dates[ride[0]].sum 
		else 
			hash_dates[ride[0]] = ride[1]
		end 
	end 
	most_money = hash_dates.max_by {|date, cost| cost} 
	puts "Driver #{driver} made the most money on #{most_money[0]} by making $#{most_money[1]}."
	
end 
