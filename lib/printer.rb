class Printer
  @requirement

  def initialize(requirement)
    @requirement = requirement
  end

  def process_output(route_map)
    count = 1
    prepare_for_send = {1 => {:weight_of_certain_route => ['path']},
                       2 => {:number_of_routes_with_max_stops => ['startStation', 'endStation', 'maxStop']},
                       3 => {:weight_of_shortest_route => ['startStation', 'endStation']},
                       4 => {:number_of_routes_with_max_weight => ['startStation', 'endStation', 'maxLength']}
    }
    prepare_for_send.keys.each do |serial_num|
      items_info = @requirement[serial_num]['calParams']
      items_info.each do |item_info|
        prefix = 'Output #' + count.to_s + ' : '
        prepare_params_for_send = [route_map]
        prepare_for_send[serial_num].values[0].each do |param|
          prepare_params_for_send << item_info[param]
        end
        count += 1
        puts prefix.send(:+, Calculator.send(prepare_for_send[serial_num].keys[0], *prepare_params_for_send).to_s)
      end
    end
  end
end
