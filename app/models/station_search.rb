class StationSearch
  def initialize(zip_code)
    @location   = zip_code
    @radius     = "6.0"
    @fuel_type  = "LPG, ELEC"
    @limit      = "10"
  end

  def all
    response = NRELSearchService.find_by(location, radius, fuel_type, limit)
    StationSearchResult.new(response).stations
  end

  private
    attr_reader :location, :radius, :fuel_type, :limit
end
