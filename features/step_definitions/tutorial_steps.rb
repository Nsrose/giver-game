Given /the following games exist/ do |games_table|
  games_table.hashes.each do |game|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that game to the database here.
    print game
    GivingGame.create!(game)
  end
end

When(/^I follow "([^"]*)" from the dropdown menu in the navbar$/) do |tutorial|
  within('ul.dropdown-menu', visible: false) do
    click_link tutorial
  end
end

Then(/^The tutorial titled "([^"]*)" should be there$/) do |tutorial|
  step "I should see \"#{tutorial}\""
end