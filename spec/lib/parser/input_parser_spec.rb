require 'parser/input_parser'

RSpec.describe InputParser, type: :parser do
  describe '#route' do
    context 'with towns routes' do
      it 'should return a route map' do
        file_name = 'resource/route.yml'
        route_map = {'A'=> {'B' => 5, 'D' => 5, 'E' => 7}, 'B' => {'C' => 4}, 'C' => {'D' =>8, 'E' => 2}, 'D' => {'C' => 8, 'E' => 6}, 'E' => {'B' => 3}}
        expect(InputParser.yaml_parser(file_name)).to eq(route_map)
      end
    end
  end

  describe '#requirement' do
    context 'with calculation requirement' do
      it 'should return parsed requirement' do
        file_name = 'resource/calculation_requirement_and_condition.yml'
        params = {1 => {"requirement"=>"lengthOfPath", "calParams"=>["ABC", "AD", "ADC", "AEBCD", "AED"]},
                  2 => {"requirement"=>"numberOfPath", "maxStops"=>3, "path"=>["CC", "AE"]},
                  3 => {"requirement"=>"shortestLengthOfPath", "path"=>["AC", "BB"]},
                  4 => {"requirement"=>"numberOfPath", "maxLength"=>30, "path"=>["CC"]}}
        expect(InputParser.yaml_parser(file_name)).to eq(params)
      end
    end
  end
end