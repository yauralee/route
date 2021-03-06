$LOAD_PATH << '.'
require 'service/read_route.rb'

$map = ReadRoute.read_route()
$min_weight = 10000
$end_node = ''
def length_of_shortest_route(current_node, routes, weight)
  if current_node == $end_node && routes != ''
    $min_weight = weight if weight < $min_weight
    return
  end
  return if weight > $min_weight
  $map[current_node].keys.each do |node|
    length_of_shortest_route(node, routes + node , weight + $map[current_node][node])
  end
end

$end_node ='C'
length_of_shortest_route('A', '', 0)
puts $min_weight