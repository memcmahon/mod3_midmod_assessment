class SearchController < ApplicationController
  def index
    binding.pry
    @stations = StationSearch.new(params[:q]).all
  end
end

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
    attr_readers :location, :radius, :fuel_type, :limit
end

class NRELSearchService
  def self.find_by(location, radius, fuel_type, limit)
    conn = Faraday.new("")
