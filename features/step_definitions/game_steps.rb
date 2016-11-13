Then(/^I should see: "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)"$/) do |arg1, arg2, arg3, arg4|
  step "I should see \"#{arg1}\""
  step "I should see \"#{arg2}\""
  step "I should see \"#{arg3}\""
  step "I should see \"#{arg4}\""
end

Then(/^I should see only "([^"]*)" games?$/) do |arg1|
  step "I should see \"Total Number of Games: #{arg1}\""
end

When /^I follow "(.*)" in my table$/ do |game|
  within('table.table.table-hover') do
    click_link game
  end
end

When /^I fill out the form$/ do
  steps %Q{
    And I fill in "Title" with "First Game"
    And I fill in "Description" with "Descriptive description to describe"
    And I fill in "TotalMoney" with "1000"
    And I fill in "AmountPerVote" with "10"
    When I select "Against Malaria Foundation" from "game_charity_a_id"
    When I select "GiveDirectly" from "game_charity_b_id"
    }
end

When /^I fill out the form with a second game$/ do
  steps %Q{
    And I fill in "Title" with "New Game"
    And I fill in "Description" with "Descriptive description to describe"
    And I fill in "TotalMoney" with "100"
    And I fill in "AmountPerVote" with "10"
    When I select "Schistosomiasis Control Initiative (SCI)" from "game_charity_a_id"
    When I select "GiveDirectly" from "game_charity_b_id"
  }
end

When /^I fill out the form with values (.*)$/ do |arguments|
  dict = {}
  args = arguments.split(",")
  args.each { |pair| 
    split_pair = pair.split(": ")
    dict[split_pair[0]] = split_pair[1]
  }
  dict.each { |key, arg| 
    steps %Q{ And I fill in #{key} with #{arg}}
  }
end


When /^I fill out the form with negative numbers$/ do
  steps %Q{
    When I fill out the form
    And I fill in "TotalMoney" with "-1000"
    And I fill in "AmountPerVote" with "-10"
  }
end
  
When /^the form is blank$/ do
  steps %Q{
    And I fill in "Title" with ""
    And I fill in "Description" with ""
    And I fill in "TotalMoney" with ""
    And I fill in "AmountPerVote" with ""
  }
end

When /^I fill out the form without descriptions$/ do
  steps %Q{
    And I fill in "Title" with "First Game"
    And I fill in "Description" with "Descriptive description to describe"
    And I fill in "TotalMoney" with "1000"
    And I fill in "AmountPerVote" with "10"
    When I select "Schistosomiasis Control Initiative (SCI)" from "game_charity_a_id"
    When I select "GiveDirectly" from "game_charity_b_id"
  }
end

When /^I upload an image to the form$/ do
  attach_file(:png_file, File.join(Rails.root, 'features', 'upload-files', 'img_1.png'))
  click_button "Attach image"
end

Then /^I should see "(.*)" in my table$/ do |game|
  table_results = page.find('table.table.table-hover')
  table_results.should have_content(game)
end

Then /^I should see "(.*)" in "(.*)" centered/ do |text, field|
  within('.text-center #%s' % [field]) do
    page.should have_content(text)
  end
end

And /^The game "(.*)" should be able to show results$/ do |game|
  GivingGame.where(:title => game).first.show_results.should == true
end

And /^The game "(.*)" should not be able to show results$/ do |game|
  GivingGame.where(:title => game).first.show_results.should == false
end    

When(/^I upload an image called "([^"]*)"$/) do |image|
  attach_file("CharityA-Image", File.absolute_path("features/upload-files/#{image}"))
end


When /^I create a( private)? game called "(.*)"$/ do |secret, name|
  steps %Q{
    When I am on the new games page
    And I fill out the form with values "Title": "#{name}","Description": "Descriptive description to describe","TotalMoney": "100","AmountPerVote": "10"
    When I select "Schistosomiasis Control Initiative (SCI)" from "game_charity_a_id"
    When I select "GiveDirectly" from "game_charity_b_id"
    Then the "private_game" radio button should be chosen
  }
  if not secret
    steps %Q{When I choose "public_game"}
  end
  steps %Q{
    And I press "Submit New Game"
  }
end