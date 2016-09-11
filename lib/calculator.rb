class Calculator

  def self.weight_of_certain_route(route_map, certain_route)
    weight = 0
    (0..certain_route.length-2).each do |index|
      weight_tmp = route_map.weight_between_two_stations(certain_route[index], certain_route[index+1])
      break weight = -1 if weight_tmp == -1
      weight += weight_tmp
    end
    weight == -1 ? 'NO SUCH ROUTE' : weight
  end

  def self.number_of_routes_with_max_stops(route_map, start_station, end_station, max_stop)
    params = {:route_map => route_map, :end_station => end_station, :max_stop => max_stop, :number_of_routes => 0}
    route_with_max_stop(start_station, 1, params)
    params[:number_of_routes]
  end

  def self.weight_of_shortest_route(route_map, start_station, end_station)
    params = {:route_map => route_map, :end_station => end_station, :weight => 1000}
    shortest_route(start_station, '', 0, params)
    params[:weight]
  end

  def self.number_of_routes_with_max_weight(route_map, start_station, end_station, max_weight)
    params = {:route_map => route_map, :end_station => end_station, :max_weight => max_weight, :number_of_routes => 0}
    route_with_max_weight(start_station, '', 0, params)
    params[:number_of_routes]
  end

  private

  def self.route_with_max_stop(current_station, current_stop, params)
    return if current_stop > params[:max_stop]
    params[:route_map].next_stations(current_station).each do |station|
      route_with_max_stop(station, current_stop + 1, params)
    end
    params[:number_of_routes] += 1 if current_station == params[:end_station]
  end

  def self.shortest_route(current_station, current_route, weight, params)
    if current_station == params[:end_station] && current_route != ''
      params[:weight] = weight if weight < params[:weight]
      return
    end
    return if weight > params[:weight]
    params[:route_map].next_stations(current_station).each do |station|
      shortest_route(station, current_route + station, weight + params[:route_map].weight_between_two_stations(current_station, station), params)
    end
  end

  def self.route_with_max_weight(current_station, current_route, weight, params)
    return if weight>= params[:max_weight]
    params[:route_map].next_stations(current_station).each do |station|
      route_with_max_weight(station, current_route + current_station, weight + params[:route_map].weight_between_two_stations(current_station, station), params)
    end
    params[:number_of_routes] += 1 if current_station == params[:end_station] && current_route != ''
  end
end