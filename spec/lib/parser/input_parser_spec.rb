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
        file_name = 'resource/requirement.yml'
        params = {1=>{"requirement"=>"lengthOfPath", "condition"=>nil, "calParams"=>[{"path"=>"ABC"}, {"path"=>"AD"}, {"path"=>"ADC"}, {"path"=>"AEBCD"}, {"path"=>"AED"}]},
                  2=>{"requirement"=>"numberOfPath", "condition"=>"lessThanCertainSteps", "calParams"=>[{"startStaion"=>"C", "endStation"=>"C", "maxStep"=>3}, {"startStaion"=>"C", "endStation"=>"C", "maxStep"=>3}]},
                  3=>{"requirement"=>"lengthOfPath", "condition"=>"shortest", "calParams"=>[{"startStaion"=>"A", "endStation"=>"C"}, {"startStaion"=>"B", "endStation"=>"B"}]},
                  4=>{"requirement"=>"numberOfPath", "condition"=>"lessThanCertainLength", "calParams"=>[{"startStation"=>"C", "endStation"=>"C", "maxLength"=>30}]}}
        expect(InputParser.yaml_parser(file_name)).to eq(params)
      end
    end
  end
end