Given /the following users exist/ do |users_table|
  users_table.hashes.each do |user|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that game to the database here.
    User.create!(user)
  end
end

Given(/^some games and some users exist:$/) do
  games = [{:title => 'Game 1', :description =>'This is game', :charityA_title => 'Charity A', :charityB_title => 'Charity B', :tutorial => false, :user_id => 1, :resource_id => 9873},
        {:title => 'Game 2', :description =>'This is not a tutorial', :charityA_title => 'Charity A', :charityB_title => 'Charity B', :tutorial => false, :resource_id => 9872},
        {:title => 'Game 3', :description =>'This is not a tutorial', :charityA_title => 'Charity A', :charityB_title => 'Charity B', :tutorial => false,  :resource_id => 3493}]
  games.each do |game|
    GivingGame.create!(game)
  end
  user = User.create! :email => 'j0e@tr8er.org', :password => 'TRAITORJOE', :password_confirmation => 'TRAITORJOE', :username => 'Traitor_JOSEPHINE', :giving_games => [GivingGame.first], :id => 1
end

Given(/^I am logged in as "([^"]*)" with password "([^"]*)"/) do |email, password|
  step "I go to the sign in page"
  step "I fill in \"user_login\" with \"#{email}\""
  step "I fill in \"user_password\" with \"#{password}\""
  step "I press \"log-in\""
  step "I should see \"Signed in successfully.\""
end

