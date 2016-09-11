require 'require_all'
require_all 'lib/printer', 'lib/calculator', 'lib/route_mapper', 'lib/parser/input_parser'

RSpec.describe Printer do
  let(:printer) { Printer.new(InputParser.yaml_parser('resource/calculation_requirement_and_condition.yml')) }
  let(:route_map) { RouteMapper.new(InputParser.yaml_parser('resource/route.yml')) }
  describe '#process_output' do
    context 'with route map' do
      it 'should return the result of requirement' do
        results = ['Output #1 : 9', 'Output #2 : 5', 'Output #3 : 13', 'Output #4 : 22', 'Output #5 : NO SUCH ROUTE', 'Output #6 : 2', 'Output #7 : 2', 'Output #8 : 9', 'Output #9 : 9', 'Output #10 : 7']
        (0..9).each do |index|
          expect(STDOUT).to receive(:puts).with(results[index])
        end
        printer.process_output(route_map)
      end
    end
  end
end