require 'rails_helper'

describe "As a user" do
  describe "When I visit root" do
    it "I can search for stations by index" do
      visit "/"

      fill_in "q", with: "80203"

      click_on "Locate"

      expect(current_path).to eq("/search?location=80203")

      expect(page).to have_content("Name", count: 10)
      expect(page).to have_content("Address", count: 10)
      expect(page).to have_content("Fuel Types", count: 10)
      expect(page).to have_content("Distance", count: 10)
      expect(page).to have_content("Access Times", count: 10)
    end
  end
end

# Then I should see a list of the 10 closest stations within 6 miles sorted by distance
# And the stations should be limited to Electric and Propane
