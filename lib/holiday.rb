require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  # return the second element in the 4th of July array
  holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  holiday_hash.each do |seasons, holidays_in_season|
    if seasons == :winter
      holidays_in_season.each do |holiday, supplies|
        supplies << supply
      end
    end
  end
  holiday_hash[:winter]
end


def add_supply_to_memorial_day(holiday_hash, supply)
  holiday_hash.each do |seasons, holidays_in_season|
    holidays_in_season.each do |holiday, supplies|
      if holiday == :memorial_day
        supplies << supply
      end
    end
  end
  holiday_hash[:spring]
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  holiday_hash[season][holiday_name] = supply_array
  holiday_hash
end

def all_winter_holiday_supplies(holiday_hash)
  holiday_hash[:winter].values.flatten
end

def all_supplies_in_holidays(holiday_hash)
  holiday_hash.each do |seasons, holidays_in_season|
    puts "#{seasons}:".to_s.capitalize!
    holidays_in_season.each do |holiday, supplies|
      if holiday.to_s.split("_").size > 1
        holiday = holiday.to_s.split("_").each {|word| word.capitalize!}
        puts "  #{holiday.join(" ")}: #{supplies.join(", ")}"
      else
        puts "  #{holiday.capitalize}: #{supplies.join(", ")}"
      end
    end
  end
end

def all_holidays_with_bbq(holiday_hash)
bbq_holidays = []
  holiday_hash.each do |seaons, holidays_in_season|
    holidays_in_season.each do |holiday, supplies|
      if supplies.include?("BBQ")
        bbq_holidays << holiday
      end
    end
  end
bbq_holidays
end
