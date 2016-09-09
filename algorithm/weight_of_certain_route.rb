$LOAD_PATH << '.'
require 'service/read_route.rb'

def weight_of_certain_route(certain_route)
  map = ReadRoute.read_route
  stops_number_of_route = certain_route.length
  current_index = 1
  @weight = 0
  loop do
    break if current_index >= stops_number_of_route
    unless map[certain_route[current_index-1]].has_key? certain_route[current_index]
      @weight = 'NO SUCH ROUTE'
      break
    end
    @weight += map[certain_route[current_index-1]][certain_route[current_index]]
    current_index += 1
  end
   p @weight
end

weight_of_certain_route('ABC')
weight_of_certain_route('AD')
weight_of_certain_route('ADC')
weight_of_certain_route('AEBCD')
weight_of_certain_route('AED')
