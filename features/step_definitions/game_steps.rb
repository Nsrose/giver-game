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
    And I fill in "Charity A" with "Syrian Refugees"
    And I fill in "DescriptionA" with "Provides money to Syrians displaced by the civil war."
    And I fill in "Charity B" with "Trump Refugees"
    And I fill in "DescriptionB" with "Donates directly to people leaving America because of Trump's policies"
  }
end

When /^I fill out the form with a second game$/ do
  steps %Q{
    And I fill in "Title" with "New Game"
    And I fill in "Description" with "Descriptive description to describe"
    And I fill in "TotalMoney" with "100"
    And I fill in "AmountPerVote" with "10"
    And I fill in "Charity A" with "Give Directly"
    And I fill in "DescriptionA" with "Provides money directly to groups of impoverished people."
    And I fill in "Charity B" with "Malaria Nets"
    And I fill in "DescriptionB" with "Provides malaria nets to locals."
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
    And I fill in "Charity A" with ""
    And I fill in "DescriptionA" with ""
    And I fill in "Charity B" with ""
    And I fill in "DescriptionB" with ""
  }
end

When /^I fill out the form without descriptions$/ do
  steps %Q{
    And I fill in "Title" with "First Game"
    And I fill in "Description" with "Descriptive description to describe"
    And I fill in "TotalMoney" with "1000"
    And I fill in "AmountPerVote" with "10"
    And I fill in "Charity A" with "Syrian Refugees"
    And I fill in "Charity B" with "Trump Refugees"
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

And /^The game "(.*)" should be able to show results$/ do |game|
  GivingGame.where(:title => game).first.show_results.should == true
end

And /^The game "(.*)" should not be able to show results$/ do |game|
  GivingGame.where(:title => game).first.show_results.should == false
end    

When(/^I upload an image called "([^"]*)"$/) do |image|
  attach_file("CharityA-Image", File.absolute_path("features/upload-files/#{image}"))
end


Then /^I should see the image "(.+)"$/ do |image|
   expect(page).to have_xpath("//img[contains(@src,'#{image}')]")
end