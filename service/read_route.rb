require 'yaml'

class ReadRoute
  def self.read_route
    railroad_map = {}
    original_route = YAML.load_file('assets/route.yml')
    routes = original_route.split(',')
    routes.each do |route|
      if railroad_map.has_key?(route[0])
        railroad_map[route[0]][route[1]]=route[2..-1].to_i
      else
        railroad_map[route[0]] = {route[1] => route[2..-1].to_i}
      end
    end
    railroad_map
  end
end

