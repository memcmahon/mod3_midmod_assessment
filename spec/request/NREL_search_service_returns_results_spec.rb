require 'rails_helper'

describe "Service can make a successful API request" do
  it "returns list of stations" do
    json_response = File.open("./spec/fixtures/stations.json")

    stub_request(:get, "https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json").
    to_return(status: 200, body: json_response, headers: {})

    visit '/'

    fill_in "q", with: 80203

    expect(page).to have_content('Name: UDR')
    expect(page).to have_content('Address: 800 Acoma St')
    expect(page).to have_content('Fuel Types: ELEC')
    expect(page).to have_content('Distance: 0.31422')
    expect(page).to have_content('Access Times: 24 hours daily')
  end
end
