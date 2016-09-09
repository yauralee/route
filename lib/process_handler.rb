require './route_map'
require './calculation'
require './parser/input_parser'

class ProcessHandler
  def self.main(routes_yml, params_yml)
    parsed_routes = InputParser.yaml_parser(routes_yml)
    @params = InputParser.yaml_parser(params_yml)
    @route_map = RouteMap.new(parsed_routes)
    @count = 1
    process_output
  end

  private
  def self.process_output
    prefix = 'Output #' + @count.to_s + ': '
    @params[1].each do |route|
      puts prefix + Calculation.weight_of_certain_route(@route_map, route).to_s
      @count += 1
    end
    @params[2].each do |param|
      puts prefix + Calculation.number_of_routes_with_max_stops(@route_map,param[0],param[1],param[2..-1].to_i).to_s
      @count += 1
    end
    @params[3].each do |param|
      puts prefix + Calculation.weight_of_shortest_route(@route_map, param[0], param[1]).to_s
      @count += 1
    end
    @params[4].each do |param|
      puts prefix + Calculation.number_of_routes_with_max_weight(@route_map,param[0],param[1],param[2..-1].to_i).to_s
      @count += 1
    end
  end
end

ProcessHandler.main('../assets/routes.yml', '../assets/params.yml')