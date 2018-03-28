class StationSearchResult
  def initialize(response)
    @latitude = response[:latitude]
    @longitude = response[:longitude]
    @total_results = response[:total_results]
    @station_list = response[:fuel_stations]
  end

  def stations
    station_list.map do |info|
      Station.new(info)
    end
  end

  private
    attr_reader :latitude, 
