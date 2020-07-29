require "test/unit" 
require_relative "../time_it_takes_to_reach"

class TestingTimeItTakeToReach < Test::Unit::TestCase

    def test_calculate_hours_difference
        #test that the difference track_a_speed and track_b_speed is 
         diff_hours = TimeItWillTakeToReach.calculate_hours_difference "8:00am", "8:30am"
         #8:30-8:00am = 0.5. half an hour
         assert_equal  0.5, diff_hours
         diff_hours = TimeItWillTakeToReach.calculate_hours_difference "2:00", "14:30"
         # 2:00 -14:30 = 12.5
         assert_equal diff_hours, 12.5
         diff_hours = TimeItWillTakeToReach.calculate_hours_difference "2:00am", "2:00pm"
         # 2:00 am - 2:00pm = 12
         assert_equal diff_hours, 12
    end

    def test_calculate_distance_to_cover
        distance_to_cover = TimeItWillTakeToReach.calculate_distance_to_cover 80, 0.5
        assert_equal 40, distance_to_cover
    end

    def test_calculate_time_it_will_take
        distance_to_cover = 40
        diff_speed =40
        # T = D/S 
        # 40/40 = 1 hour
        time_it_will_take_to_reach = TimeItWillTakeToReach.calculate_time_it_will_take distance_to_cover, diff_speed
        assert_equal time_it_will_take_to_reach, 1
    end

    def test_time_it_will_take
        time_it_will_take = TimeItWillTakeToReach.time_it_will_take_hours track_a_speed:"80 km/h" , 
                                                                     track_b_speed:"120 km/h", track_a_departure_time:"8:00am", 
                                                                      track_b_departure_time:"8:30am"
        assert_equal 1,time_it_will_take                                                              
    end

    def test_convert_to_km_h
        # assert it raise if there is no space between the value and unit
        assert_raise RuntimeError do
            TimeItWillTakeToReach.convert_to_km_h "80km/h"
        end
        #assert it does not raise if the value and unit are separated
        assert_nothing_raised RuntimeError do
            TimeItWillTakeToReach.convert_to_km_h "80 km/h"
        end
        speed = TimeItWillTakeToReach.convert_to_km_h "80 km/h"
        assert_equal 80, speed
        speed = TimeItWillTakeToReach.convert_to_km_h "80 m/s"
        assert_equal 288, speed
        #assert with difference casing
        speed = TimeItWillTakeToReach.convert_to_km_h "80 M/s"
        assert_equal 288, speed
    end


end
