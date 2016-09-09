require 'route_map'
require 'parser/input_parser'

RSpec.describe RouteMap do
  let(:route_map) {RouteMap.new({'A'=> {'B' => 5, 'D' => 5, 'E' => 7}})}
  describe '#next_stations' do
    context 'with one station' do
      it 'should return next stations' do
        station = 'A'
        expect(route_map.next_stations(station)).to eq(['B', 'D', 'E'])
      end
    end
  end

  describe '#weight_of_two_stations' do
    context 'with two certain staions' do
      it 'should return weight of these two stations if route exists' do
        station = 'A'
        next_station = 'B'
        expect(route_map.weight_between_two_stations(station, next_station)).to eq(5)
      end

      it 'should return -1 if station is not exists' do
        station = 'B'
        next_station = 'D'
        expect(route_map.weight_between_two_stations(station, next_station)).to eq(-1)
      end

      it 'should return -1 if next station is not exists' do
        station = 'A'
        next_station = 'F'
        expect(route_map.weight_between_two_stations(station, next_station)).to eq(-1)
      end
    end
  end
end



