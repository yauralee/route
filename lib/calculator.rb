class Calculator

  # @route_map

  # def self.prepare_for_output(route_map)
  #   @route_map = route_map
  # end

  def self.weight_of_certain_route(route_map, certain_route)
    weight = 0
    (0..certain_route.length-2).each { |index|
      weight_tmp = route_map.weight_between_two_stations(certain_route[index], certain_route[index+1])
      break weight = -1 if weight_tmp == -1
      weight += weight_tmp
    }
    weight == -1 ? 'NO SUCH ROUTE' : weight
  end

  def self.number_of_routes_with_max_stops(route_map, start_and_end_station, max_stop)
    @condition_and_requirement = {:route_map => route_map, :end_station => start_and_end_station[1],
                                  :max_stop => max_stop, :number_of_routes => 0}
    route_with_max_stop(start_and_end_station[0], 1)
    @condition_and_requirement[:number_of_routes]
  end

  def self.weight_of_shortest_route(route_map, start_and_end_station)
    @condition_and_requirement = {:route_map => route_map, :end_station => start_and_end_station[1],
                                  :min_weight => 1000}
    shortest_route(start_and_end_station[0], '', 0)
    @condition_and_requirement[:min_weight]
  end

  def self.number_of_routes_with_max_weight(route_map, start_and_end_station, max_weight)
    @condition_and_requirement = {:route_map => route_map, :end_station => start_and_end_station[1],
                                  :max_weight => max_weight, :number_of_routes => 0}
    route_with_max_weight(start_and_end_station[0], '', 0)
    @condition_and_requirement[:number_of_routes]
  end


  private

  def self.route_with_max_stop(current_station, current_stop)
    return if current_stop > @condition_and_requirement[:max_stop]
    @condition_and_requirement[:route_map].next_stations(current_station).each do |station|
      route_with_max_stop(station, current_stop + 1)
    end
    @condition_and_requirement[:number_of_routes] += 1 if current_station == @condition_and_requirement[:end_station]
  end

  def self.shortest_route(current_station, current_route, current_weight)
    if current_station == @condition_and_requirement[:end_station] && current_route != ''
      @condition_and_requirement[:min_weight] = current_weight if current_weight < @condition_and_requirement[:min_weight]
      return
    end
    return if current_weight > @condition_and_requirement[:min_weight]
    @condition_and_requirement[:route_map].next_stations(current_station).each do |station|
      shortest_route(station, current_route + station,
                     current_weight + @condition_and_requirement[:route_map].weight_between_two_stations(current_station, station))
    end
  end

  def self.route_with_max_weight(current_station, current_route, weight)
    return if weight >= @condition_and_requirement[:max_weight]
    @condition_and_requirement[:route_map].next_stations(current_station).each do |station|
      route_with_max_weight(station, current_route + current_station,
                            weight + @condition_and_requirement[:route_map].weight_between_two_stations(current_station, station))
    end
    @condition_and_requirement[:number_of_routes] += 1 if current_station == @condition_and_requirement[:end_station] && current_route != ''
  end
end