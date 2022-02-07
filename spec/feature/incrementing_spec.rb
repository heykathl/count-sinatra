require "capybara/rspec"
require_relative "../../app"

Capybara.app = CounterApp

feature "increment the count" do
  scenario "click the Increment button and see the number increment" do
    visit("/")
    expect(page).to have_content 0
    click_button "Increment"
    click_button "Increment"
    click_button "Increment"
    expect(page).to have_button('Increment')
    expect(page).to have_content 3
    expect(page).to have_content Time.now
  end
end
 
feature "decrement the count" do
  scenario "click the Decrement button and see the number decrement" do
    visit("/")
    expect(page).to have_content 3
    click_button "Decrement"
    expect(page).to have_button('Decrement')
    expect(page).to have_content 2
    expect(page).to have_content Time.now
  end
end

feature "reset the count" do
  scenario "click the Reset button and see the number reset to zero" do
    visit("/")
    expect(page).to have_content 2
    click_button "Reset"
    expect(page).to have_button('Reset')
    expect(page).to have_content 0
    expect(page).to have_content Time.now
  end
end
