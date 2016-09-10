require 'route_mapper'
require 'parser/input_parser'

RSpec.describe RouteMapper do
  let(:route_mapper) {RouteMapper.new({'A'=> {'B' => 5, 'D' => 5, 'E' => 7}})}
  describe '#next_stations' do
    context 'with one station' do
      it 'should return next stations' do
        station = 'A'
        expect(route_mapper.next_stations(station)).to eq(['B', 'D', 'E'])
      end
    end
  end

  describe '#weight_of_two_stations' do
    context 'with two certain staions' do
      it 'should return weight of these two stations if route exists' do
        station = 'A'
        next_station = 'B'
        expect(route_mapper.weight_between_two_stations(station, next_station)).to eq(5)
      end

      it 'should return -1 if station is not exists' do
        station = 'B'
        next_station = 'D'
        expect(route_mapper.weight_between_two_stations(station, next_station)).to eq(-1)
      end

      it 'should return -1 if next station is not exists' do
        station = 'A'
        next_station = 'C'
        expect(route_mapper.weight_between_two_stations(station, next_station)).to eq(-1)
      end
    end
  end
end