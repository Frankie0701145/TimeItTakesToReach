require 'time'

class TimeItWillTakeToReach

    def self.time_it_will_take_hours(track_a_speed:, track_b_speed:, track_a_departure_time:, track_b_departure_time:)
        # check if the given speed are in m/s then convert to km/h
        track_a_speed = self.convert_to_km_h track_a_speed
        track_b_speed = self.convert_to_km_h track_b_speed
        #calculate the difference in time between the track_a_departure_time 
        diff_time_hours = self.calculate_hours_difference track_a_departure_time, track_b_departure_time
        #calculate the distance to cover
        distance_to_cover = self.calculate_distance_to_cover track_a_speed, diff_time_hours
        # find the difference in speed between the two tracks
        diff_speed =  track_b_speed - track_a_speed 
    
        # calculate the time it will take
        time_it_will_take_hours = self.calculate_time_it_will_take distance_to_cover, diff_speed
        puts "It will take #{time_it_will_take_hours} hours"
        return time_it_will_take_hours
    end

    #calculate the different in hours between the time track b departed and track c departed
    def self.calculate_hours_difference track_a_departure_time, track_b_departure_time
        diff_time_seconds = Time.parse(track_b_departure_time) - Time.parse(track_a_departure_time)
        diff_time_hours  = diff_time_seconds/3600
    end

    def self.calculate_distance_to_cover track_a_speed, diff_time_hours
        # calculate the distance to cover
        # formular D = S * T
        distance_to_cover = track_a_speed * diff_time_hours
    end

    def self.calculate_time_it_will_take distance_to_cover, diff_speed
        #calculate the time it will take to arrive
        #formular T = D/S
        time_it_will_take = distance_to_cover/diff_speed
    end

    # converts m/s to km/h

    def self.convert_to_km_h track_speed
        speed_value_a = track_speed.split " "
        raise "Please make sure to seperate the value and unit. Like this 80 km/h or 80 m/s and also you provide the unit" if speed_value_a.size < 2
        speed = speed_value_a[0].to_f
        unit = speed_value_a[1].downcase
        case unit
        when "km/h" then
            return speed
        when "m/s" then
            return speed*18/5
        end
    end
end


TimeItWillTakeToReach.time_it_will_take_hours(track_a_speed:"70 Km/h" , track_b_speed:"120 Km/h", track_a_departure_time:"8:00am", track_b_departure_time:"8:30am")



