require 'parser/input_parser'

RSpec.describe InputParser, type: :parser do
  describe '#route_map' do
    context 'with route of towns' do
      it 'should return a route map as hash' do
        file_name = 'routes.yml'
        route_map = {'A'=> {'B' => 5, 'D' => 5, 'E' => 7}, 'B' => {'C' => 4}, 'C' => {'D' =>8, 'E' => 2}, 'D' => {'C' => 8, 'E' => 6}, 'E' => {'B' => 3}}
        expect(InputParser.yaml_parser(file_name)).to eq(route_map)
      end
    end
  end

  describe '#test_params' do
    context 'with test params' do
      it 'should return formatted params as hash' do
        file_name = 'params.yml'
        params = {1 => ['ABC','AD','ADC','AEBCD','AED'], 2 => ['CC3'], 3 => ['AC','BB'], 4 => ['CC30']}
        expect(InputParser.yaml_parser(file_name)).to eq(params)
      end
    end
  end
end