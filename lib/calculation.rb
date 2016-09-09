class Calculation
  def self.weight_of_certain_route(route_map, certain_route)
    current_index = 0
    weight = 0
    loop do
      break if current_index >= certain_route.length - 1
      weight_tmp = route_map.weight_of_two_stations(certain_route[current_index], certain_route[current_index+1])
      weight = weight_tmp == -1 ? 'NO SUCH ROUTE' : weight + weight_tmp
      current_index += 1
    end
    weight
  end

  def self.number_of_routes_with_max_stops(route_map, start_station, end_station, max_stop)
    @number_of_routes = 0
    @max_stop = max_stop
    @end_station = end_station
    @route_map = route_map
    find_route_with_max_stop(start_station, 1)
    @number_of_routes
  end

 private
  def self.find_route_with_max_stop(current_station, current_stop)
    return if current_stop > @max_stop
    @route_map.next_stations(current_station).each do |station|
      find_route_with_max_stop(station, current_stop + 1)
    end
    @number_of_routes += 1 if current_station == @end_station
  end
end