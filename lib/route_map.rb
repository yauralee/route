class RouteMap
  @routes

  def initialize(routes)
    @routes = routes
  end

  def next_stations(station)
    @routes[station].keys if @routes.has_key?(station)
  end

  def weight_of_two_stations(start_station, end_station)
    @routes.has_key?(start_station) && @routes[start_station].has_key?(end_station) ? @routes[start_station][end_station] : -1
  end

end

