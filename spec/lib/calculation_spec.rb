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

  describe '#number_of_routes_with_max_stops' do
    context 'with max stop' do
      it 'should return the number of routes between two stations' do
        start_station = 'C'
        end_station = 'C'
        max_stop = 3
        expect(Calculation.number_of_routes_with_max_stops(route_map,start_station,end_station,max_stop)).to eq(2)
      end
    end
  end
  
  describe '#weight_of_shortest_route' do
    context 'with two stations' do
      it 'should return weight of the shortest route' do
        start_station = 'A'
        end_station = 'C'
        expect(Calculation.weight_of_shortest_route(route_map,start_station,end_station)).to eq(9)
      end
    end
  end
end

