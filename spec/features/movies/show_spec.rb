require 'rails_helper'

RSpec.describe "movies show page" do
  before :each do
    @movie = MovieData.first
  end

  it "displays the item and its attributes" do
    visit "/merchants/#{@merchant_1.id}/items/#{@item_1.id}"

    expect(page).to have_content(@item_1.name)
    expect(page).to have_content(@item_1.description)
    expect(page).to have_content("$751.07")
  end

  it "displays the item and its attributes" do
    visit "/merchants/#{@merchant_1.id}/items/#{@item_1.id}"

    click_link 'Update Item'

    expect(current_path).to eq("/merchants/#{@merchant_1.id}/items/#{@item_1.id}/edit")
  end
end
