class StationObject

  attr_reader :name, :distance, :travel_time, :address, :directions, :fuel_type, :access_times

  def initialize(data)
    @name = data[:station_name]
    @address = [data[:street_address], data[:city], data[:state]].join(", ")
    @fuel_type = data[:fuel_type_code]
    @access_times = data[:access_days_time]
  end

  def add_trip(data)
    add_distance(data)
    add_travel_time(data)
    add_directions(data)
  end

  def add_distance(data)
    @distance = data.sum do |leg|
      leg[:maneuvers].sum do |maneuver|
        maneuver[:distance]
      end
    end.round(1)
  end

  def add_travel_time(data)
    @travel_time = (data.sum do |leg|
      leg[:maneuvers].sum do |maneuver|
        maneuver[:time]
      end
    end.to_f / 60).ceil
  end

  def add_directions(data)
    @directions = data.map do |leg|
      leg[:maneuvers].map do |maneuver|
        maneuver[:narrative]
      end
    end.flatten.join(" ")
  end
end
