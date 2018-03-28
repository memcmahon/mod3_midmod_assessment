require 'rails_helper'

describe "As a user" do
  describe "When I visit root" do
    it "I can search for stations by index" do
      visit "/"

      fill_in "q", with: "80203"

      click_on "Locate"

      expect(current_path).to eq("/search?locate=80203")
      expect(page).to have_css("station-list")
      within("station-list") do
        expect(page).to have_css("station", count: 10)
        within("station", match: first) do
          expect(page).to have_content("Name")
          expect(page).to have_content("Address")
          expect(page).to have_content("Fuel Types")
          expect(page).to have_content("Distance")
          expect(page).to have_content("Access Times")
        end
      end
    end
  end
end

# Then I should see a list of the 10 closest stations within 6 miles sorted by distance
# And the stations should be limited to Electric and Propane
