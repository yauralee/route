require 'yaml'

class InputParser
  def self.parsed_yaml(file_name)
    YAML.load_file(file_name)
  end
end

# p RequirementParser.parsed_requirement