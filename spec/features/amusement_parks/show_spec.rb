require "rails_helper"

RSpec.describe "Amusment Park Show" do
  it "shows the amusement park's attributes and mechanics" do
    sixflags = AmusementPark.create!(name: "Six Flags", admission_cost: 314)

    dave = Mechanic.create!(name: "Dave", years_of_experience: 21)
    ethan = Mechanic.create!(name: "Ethan", years_of_experience: 51)
    frank = Mechanic.create!(name: "Frank", years_of_experience: 21)

    swing = Ride.create!(name: "Swing", thrill_rating: 1, open: false, amusement_park: sixflags)
    coaster = Ride.create!(name: "Coaster", thrill_rating: 5, open: false, amusement_park: sixflags)
    drop = Ride.create!(name: "Drop", thrill_rating: 6, open: false, amusement_park: sixflags)
    spin = Ride.create!(name: "Spin", thrill_rating: 6, open: false, amusement_park: sixflags)
    bump = Ride.create!(name: "Bump", thrill_rating: 6, open: false, amusement_park: sixflags)

    MechanicRide.create!(mechanic: dave, ride: swing)
    MechanicRide.create!(mechanic: dave, ride: coaster)
    MechanicRide.create!(mechanic: dave, ride: drop)
    MechanicRide.create!(mechanic: ethan, ride: drop)
    MechanicRide.create!(mechanic: ethan, ride: spin)
    MechanicRide.create!(mechanic: frank, ride: bump)

    visit "amusement_parks/#{sixflags.id}"

    expect(page).to have_content("Six Flags")
    expect(page).to have_content("314")
    expect(page).to have_content("Dave")
    expect(page).to have_content("Ethan")
    expect(page).to have_content("Frank")
  end
end
