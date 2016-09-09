$LOAD_PATH << '.'
require 'service/read_route.rb'

$number_of_trips = 0
$map =  ReadRoute.read_route

  def number_of_trips_between_two_stops(current_node, routes, stop, end_node, max_stop)
    return if stop > max_stop
    $map[current_node].keys.each do |node|
      number_of_trips_between_two_stops(node, routes+current_node, stop + 1, end_node, max_stop)
    end

    if current_node == end_node && routes != ""
      routes += current_node
      $number_of_trips += 1
      p routes
    end
  end

  number_of_trips_between_two_stops('C', '', 0, 'C', 3)
  p $number_of_trips
