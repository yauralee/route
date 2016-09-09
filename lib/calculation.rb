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
end