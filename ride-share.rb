RIDE_SHARE = {
    'DR0004': [
        {
            date: '3rd Feb 2016',
            cost: 5,
            rider_id: 'RD0022',
            rating: 5
        },
        {
            date: '4th Feb 2016',
            cost: 10,
            rider_id: 'RD0022',
            rating: 4
        },
        {
            date: '5th Feb 2016',
            cost: 20,
            rider_id: 'RD0073',
            rating: 5   
        }
    ],
    'DR0001': [
        {
            date: '3rd Feb 2016',
            cost: 10,
            rider_id: 'RD0003',
            rating: 3            
        },
        {
            date: '3rd Feb 2016',
            cost: 30,
            rider_id: 'RD0015',
            rating: 4
        },
        {
            date: '5th Feb 2016',
            cost: 45,
            rider_id: 'RD0003',
            rating: 2
        }
    ],
    'DR0002': [
        {
            date: '3rd Feb 2016',
            cost: 25,
            rider_id: 'RD0073',
            rating: 5            
        },
        {
            date: '4th Feb 2016',
            cost: 15,
            rider_id: 'RD0013',
            rating: 1
        },
        {
            date: '5th Feb 2016',
            cost: 35,
            rider_id: 'RD0066',
            rating: 3
        }
    ],
    'DR0003': [
        {
            date: '4th Feb 2016',
            cost: 5,
            rider_id: 'RD0066',
            rating: 5            
        },
        {
            date: '5th Feb 2016',
            cost: 50,
            rider_id: 'RD0003',
            rating: 2
        }
    ]
}

def ride_share_summary(ride_share)
    puts "Summary: "

    average_rating_list = {}    # key is averate rate and value is driver id
    money_earned_list = {}  # key is income and value is driver id

    ride_share.each do |driver, rides|
        this_driver_earned_total = 0
        this_driver_rating_total = 0
        this_driver_daily_income = {} # key is date, value is income on this date
        
        rides.each do |ride|
            this_driver_earned_total += ride[:cost]
            this_driver_rating_total += ride[:rating]
        
            # driver may made more than one ride on each day, check whether the key exists
            if !this_driver_daily_income[ride[:date].to_sym]
                this_driver_daily_income[ride[:date].to_sym] = ride[:cost]
            else
                this_driver_daily_income[ride[:date].to_sym] += ride[:cost]
            end
        end
    
        this_driver_rating_average = (this_driver_rating_total.to_f / rides.length).round(1)

        this_driver_highest_daily_income = this_driver_daily_income.values.max
        this_driver_highest_daily_income_date = [] # two days may have the same income, so using an array to collect all the dates.
        this_driver_daily_income.each do |date, income|
            if income == this_driver_highest_daily_income
                this_driver_highest_daily_income_date.push(date.to_s)
            end
        end

        puts "Driver Id: #{driver}"
        puts " Total rides: #{rides.length} rides"
        puts " Total income: $#{this_driver_earned_total}"
        puts " Average rating: #{this_driver_rating_average}"
        puts " Date(s) with highest income: #{this_driver_highest_daily_income_date.join(', ')} of $#{this_driver_highest_daily_income}"
        puts "\n"

        # it may happen that two or more drivers have the same total income. So just check if the income(key) amount exists in the list, if it exists, push the driver id into the array(value)
        if !money_earned_list[this_driver_earned_total]
            money_earned_list[this_driver_earned_total] = [driver]
        else
            money_earned_list[this_driver_earned_total].push(driver)
        end

        # it may happen that two or more drivers have the same rating. So just check if the rating(key) exists in the list, if it exists, push the driver id into the array(value)
        if !average_rating_list[this_driver_rating_average]
            average_rating_list[this_driver_rating_average] = [driver]
        else
            average_rating_list[this_driver_rating_average].push(driver)
        end
    end

    highest_income = money_earned_list.keys.max
    driver_earned_most = money_earned_list[highest_income].join(', ')
    
    puts "The driver(s) made the most money is(are) #{driver_earned_most}. The amount is $#{highest_income}."

    highest_rating = average_rating_list.keys.max
    driver_rating_highest = average_rating_list[highest_rating].join(', ')
    
    puts "The driver(s) has(have) the highest rating is(are) #{driver_rating_highest}. The rating is #{highest_rating}."
end

ride_share_summary(RIDE_SHARE)
