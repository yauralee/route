# require './calculator'
# require './route_mapper'
# require './printer'
# require './parser/input_parser'
Dir["#{File.dirname(__FILE__)}/*/*.rb"].each {|file| require file }
Dir["#{File.dirname(__FILE__)}/*.rb"].each {|file| require file }

class ProcessHandler
  def self.process(routes_yml, requirement_yml)
    parsed_routes = InputParser.yaml_parser(routes_yml)
    requirement = InputParser.yaml_parser(requirement_yml)
    route_map = RouteMapper.new(parsed_routes)
    Printer.new(requirement).process_output(route_map)
  end
end

# ProcessHandler.process('../resource/route.yml', '../resource/requirement.yml')
