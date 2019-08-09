###### HELPER METHODS #######
def usd(float_var)
    # returns float_var as a string in US dollar format, ex: $12.34
    return format("$%.2f", float_var)
end

def find_best_drivers(metric, master_hash)
    # given the metric symbol and the master_hash, 
    # return the [winner's driver_id, winner's value]
    # ex: find_best_drivers(avg_rating, master_hash) returns ['DR0004', 4.67]

    summary = master_hash.map do |driver_id, driver_hash|
        [driver_id, driver_hash[metric]]
    end

    winner_hash = summary.max_by do |driver_metric_pair|
        driver_metric_pair[1]
    end

    return winner_hash
end


###### DESIGNING DATA STRUCTURE ########
master_hash = {}
# FORMAT for master_hash is 
# { 
#     driverID1: { 
#                 date1: [{ rider1: xxx, cost: xxx, rating: xxx }, {rider2:... etc} etc}]
#                 date2: [{ rider1: xxx, cost: xxx, rating: xxx }, {rider2:... etc} etc}]
#                 date3: etc...

#                 rides_count: integer,
#                 total_money: float,
#                 avg_rating: float,
#                 daily_money_log = [date1: float, date2: float, etc]
#                 day_of_highest_earning: date,
#                 },
#     driverID2: { etc },
#     driverID3: { etc }
# }

###### COMPILING DATA ########
# copy & paste raw data, date has been changed into MMDDYYYY int format
# raw elements are [driver_id, date, cost_flt, rider_id, rating_int]
raw = [
['DR0004','02032016',5,'RD0022',5],
['DR0001','02032016',10,'RD0003',3],
['DR0002','02032016',25,'RD0073',5],
['DR0001','02032016',30,'RD0015',4],
['DR0003','02042016',5,'RD0066',5],
['DR0004','02042016',10,'RD0022',4],
['DR0002','02042016',15,'RD0013',1],
['DR0003','02042016',50,'RD0003',2],
['DR0002','02042016',35,'RD0066',3],
['DR0004','02042016',20,'RD0073',5],
['DR0001','02042016',45,'RD0003',2],
]

# compile raw data into master_hash
raw.each do |row|
    driver_id = row[0].to_sym
    date = row[1].to_sym
    cost_flt = row[2].to_f
    rider_id = row[3]
    rating_int = row[4]

    # eval if driver_id is new to master hash
    unless master_hash.keys.include? driver_id
        # new driver: add new hash
        master_hash[driver_id] = {}
    end    
    # if the driver already exists, so does their hash, do nothing.
    
    ticket_hash = {rider_id: rider_id, cost: cost_flt, rating: rating_int}
    
    # eval if date is new to master_hash[driver_id] 
    if master_hash[driver_id].keys.include? date
        # date exists, just add ticket to existing array
        master_hash[driver_id][date] << ticket_hash
    else
        # new date, add new array plus ticket info
        master_hash[driver_id][date] = [ticket_hash]
    end
end


###### EVALUATING DATA ########
master_hash.each do |driver, driver_hash| 
    # Evaluating for each driver...
    # announce metrics
    rides_count = 0
    total_money = 0.0
    rating_total = 0.0
    avg_rating = nil
    daily_money_log = {}

    driver_hash.each do |date, trips_that_day|
        # Evaluating each day...
        money_that_day = 0.0

        num_trips = trips_that_day.length
        rides_count += num_trips

        trips_that_day.each do |ticket|
            money = ticket[:cost]
            money_that_day += money

            rating = ticket[:rating]
            rating_total += rating
        end

        daily_money_log[date] = money_that_day 
        total_money += money_that_day
    end

    avg_rating = rating_total/rides_count

    # assess which day had most $$$
    highest_daily_earning = daily_money_log.values.max
    day_of_highest_earning = daily_money_log.key(highest_daily_earning)

    # storing metric values in master hash, for future reference
    driver_hash[:rides_count] = rides_count
    driver_hash[:total_money] = total_money 
    driver_hash[:avg_rating] = avg_rating 
    driver_hash[:daily_money_log] = daily_money_log
    driver_hash[:day_of_highest_earning] = day_of_highest_earning
end


###### PRINT RESULTS ########
puts
master_hash.each do |driver_id, hash|
    puts "SUMMARY for DRIVER #{driver_id}"
    puts "\tTotal # of rides = #{hash[:rides_count]}"
    puts "\tTotal $ made = #{usd(hash[:total_money])}"
    puts "\tAverage rating = #{hash[:avg_rating].round(2)}"
    puts "\tDay of highest earning = #{hash[:day_of_highest_earning]}"
    puts
end

puts "\n\nWhich driver made the most money?".upcase
winner_hash = find_best_drivers(:total_money, master_hash)
puts "Winner is #{winner_hash[0].to_s}, they earned #{usd(winner_hash[1])}"

puts "\n\nWhich driver has the highest average rating?".upcase
winner_hash = find_best_drivers(:avg_rating, master_hash)
puts "Winner is #{winner_hash[0].to_s}, they earned a rating of #{winner_hash[1].round(2)}"

puts





################################ EXTRA STUFF ################################

######## ACTIVATE THIS SECTION TO PRINT OUT MASTER_HASH SUMMARY ########
# puts "\n\n## MASTER HASH ##", "\tRaw data compiled into data structure below\n"
# master_hash.each do |driver, driver_hash| 
#     puts "\tDRIVER = #{driver}"
#     driver_hash.each do |date, trips_that_day|
#         puts "\t\tDATE = #{date}"
#         trips_that_day.each do |ticket|
#             puts "\t\t\tRider = #{ticket[:rider_id]}"
#             puts "\t\t\tCost = #{ticket[:cost]}"
#             puts "\t\t\tRating = #{ticket[:rating]}"
#             puts
#         end
#         puts
#     end
# end
########################################################################