require 'yaml'

class RequirementParser
  def self.parsed_requirement
    YAML.load_file('../../resource/requirement.yml')
  end
end

p RequirementParser.parsed_requirement