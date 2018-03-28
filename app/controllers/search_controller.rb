class SearchController < ApplicationController
  def index
    binding.pry
    @stations = StationSearch.find_by_zip(params[:q])
  end
end
