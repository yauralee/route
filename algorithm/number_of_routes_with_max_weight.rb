$LOAD_PATH << '.'
require 'service/read_route.rb'

  $map = ReadRoute.read_route
  $number_of_route = 0

  def number_of_trips_with_max_weight(current_node, end_node, current_route, weight, max_weight)
    if weight>= max_weight
      return
    end

    $map[current_node].keys.each do |node|
      number_of_trips_with_max_weight(node, end_node, current_route+current_node, weight + $map[current_node][node], max_weight)
    end

    if current_node == end_node && current_route != ""
      current_route += current_node
      p current_route
      $number_of_route += 1
    end
  end

  number_of_trips_with_max_weight('C', 'C', '', 0, 30)
  puts $number_of_route
