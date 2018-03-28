class NRELSearchService
  def self.find_by(location, radius, fuel_type, limit)
    conn = Faraday.new("https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json")

    response = conn.get do |req|
      req.params[:location] = location
      req.params[:radius] = radius
      req.params[:fuel_type] = fuel_type
      req.params[:limit] = limit
      req.params[:api_key] = ENV["NREL_API_KEY"]
    end

    JSON.parse(response.body, symbolize_names: true)
  end
end
