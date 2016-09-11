require 'yaml'

class InputParser
  def self.yaml_parser(file_name)
    YAML.load_file(file_name)
  end
end

