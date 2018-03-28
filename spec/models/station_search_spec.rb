require 'rails_helper'

describe StationSearch, type: :model do
  let(:station_search) { StationSearch.new(80203) }

  it "should exist" do
    expect(station_search).to be_instance_of(StationSearch)
  end

  it "should get all stations" do
    json_response = File.open("./spec/fixtures/stations.json")

    stub_request(:get, "https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?api_key=#{ENV["NREL_API_KEY"]}&fuel_type=LPG,%20ELEC&limit=10&location=80203&radius=6.0").
    to_return(status: 200, body: json_response, headers: {})

    stations = station_search.all

    expect(stations.count).to eq(10)
    expect(stations.first).to be_instance_of(Station) 
  end
end
