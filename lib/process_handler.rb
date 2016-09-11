require 'require_all'
require_all 'lib'

class ProcessHandler
  def self.process(routes_yml, requirement_yml)
    parsed_routes = InputParser.yaml_parser(routes_yml)
    requirement_and_condition = InputParser.yaml_parser(requirement_yml)
    route_map = RouteMapper.new(parsed_routes)
    result_array = Calculator.calculate_results(route_map, requirement_and_condition)
    Printer.print_result(result_array)
  end
end
