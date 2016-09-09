require 'route_map'
require 'calculation'

RSpec.describe Calculation do
  let(:route_map) {RouteMap.new(
      {'A' => {'B' => 5, 'D' => 5, 'E' => 7},
       'B' => {'C' => 4},
       'C' => {'D' => 8, 'E' => 2},
       'D' => {'C' => 8, 'E' => 6},
       'E' => {'B' => 3}
      }
  )}
  describe '#weight_of_certain_route' do
    context 'with a right route' do
      it 'should return weight' do
        certain_route = 'ABC'
        expect(Calculation.weight_of_certain_route(route_map, certain_route)).to eq(9)
      end
    end

    context 'with a wrong route' do
      it 'should return NO SUCH ROUTE' do
        certain_route = 'ABD'
        expect(Calculation.weight_of_certain_route(route_map, certain_route)).to eq('NO SUCH ROUTE')
      end
    end
  end
end
