Given /the following users exist/ do |users_table|
  users_table.hashes.each do |user|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that game to the database here.
    User.create!(user)
  end
end

# Given(/^some games and some users exist$/) do
#   games = [{:title => 'Game 1', :description =>'This is a game', :charityA_title => 'GiveDirectly', :charityB_title => 'Against Malaria Foundation', :tutorial => false, :user_id => 1, :resource_id => 9873, :show_results => true, :default_charity_a => 4, :default_charity_b => 1},
#         {:title => 'Game 2', :description =>'This is not a tutorial', :charityA_title => 'Deworm the World Initiative', :charityB_title => 'GiveDirectly', :tutorial => false, :resource_id => 9872, :show_results => false, :default_charity_a => 3, :default_charity_b => 4},
#         {:title => 'Game 3', :description =>'This is not a tutorial', :charityA_title => 'Schistosomiasis Control Initiative (SCI)', :charityB_title => 'GiveDirectly', :tutorial => false,  :resource_id => 3493, :default_charity_a => 2, :default_charity_b => 4}]
#   games.each do |game|
#     GivingGame.create!(game)
#   end
#   user = User.create! :email => 'j0e@tr8er.org', :password => 'TRAITORJOE', :password_confirmation => 'TRAITORJOE', :username => 'Traitor_JOSEPHINE', :giving_games => [GivingGame.first], :id => 1
# end

Given(/^some games and some users exist$/) do
  games = [ {
            :title => 'Game 1',
            :description =>'This is a game',
            :tutorial => false, :user_id => 1,
            :resource_id => 9873,
            :show_results => true,
            :charity_a_id => 4,
            :charity_b_id => 1,
            :is_private => false
            },
          {
            :title => 'Game 2',
            :description =>'This is not a tutorial',
            :tutorial => false,
            :resource_id => 9872,
            :show_results => false,
            :charity_a_id => 3,
            :charity_b_id => 4,
            :is_private => false
          },
          {
            :title => 'Game 3',
            :description =>'This is not a tutorial',
            :tutorial => false,
            :resource_id => 3493,
            :charity_a_id => 2,
            :charity_b_id => 4,
            :is_private => false
          },
          {   
            :title => 'Game 4',
            :description => 'This games charityA has no image',
            :tutorial => false,
            :resource_id => 3494,
            :charity_a_id => 5,
            :charity_b_id => 4
          }
          ]
  games.each do |game|
    GivingGame.create!(game)
  end
  user = User.create! :email => 'j0e@tr8er.org', :password => 'TRAITORJOE', :password_confirmation => 'TRAITORJOE', :username => 'Traitor_JOSEPHINE', :giving_games => [GivingGame.first], :id => 1
end

Given(/^some charities exist$/) do
  malaria_description = 'Malaria is one of the leading killers'
  sci_description = '500 million people throughout sub-Saharan'
  deworm_description = 'Over 870 million preschool- and school'
  giveDirectly_description = 'GiveDirectly transfers cash to' 
  
  without_image_description = 'A Charity without an image'
                        
  charities = [ {
                  :name => 'Against Malaria Foundation',
                  :description => malaria_description,
                  :ein => '20-3069841',
                  :image_link => 'http://www.againstmalaria.com/images/logo_AMF_Square.png',
                  :homepage_link => 'https://www.againstmalaria.com/Default.aspx',
                  :donation_link => 'https://www.againstmalaria.com/donate.aspx?GroupID=81'
                },
                {
                  :name => 'Schistosomiasis Control Initiative (SCI)',
                  :description => sci_description, :ein => '20-8625442',
                  :image_link => 'http://www.goodventures.org/images/grants/SCI-treatment.jpeg',
                  :homepage_link => 'https://www.imperial.ac.uk/schistosomiasis-control-initiative',
                  :donation_link => 'http://www.imperial.ac.uk/schistosomiasis-control-initiative/donate/'
                }, 
               {
                 :name => 'Deworm the World Initiative',
                 :description => deworm_description,
                 :ein => '26-3455539',
                 :homepage_link => 'http://www.evidenceaction.org/dewormtheworld/',
                 :donation_link => 'https://give.evidenceaction.org'
               },
               {
                 :name => 'GiveDirectly',
                 :description => giveDirectly_description,
                 :ein => '27-1661997',
                 :image_link => 'https://cdn.givedirectly.org/8fa1cf088be076b2943084a6efe2b7ab/basic-income-link.jpg',
                 :homepage_link => 'https://www.givedirectly.org',
                 :donation_link => 'https://www.givedirectly.org/give-now'
               },
               {
                 :name => 'CharityNoImage',
                 :description => without_image_description,
                 :ein =>'fake_ein',
                 :homepage_link => 'http://www.evidenceaction.org/dewormtheworld/',
                 :donation_link => 'https://give.evidenceaction.org'
               }
               ]
  
  charities.each do |game|
    Charity.create!(game)
  end
end

Given(/^I am logged in as "([^"]*)" with password "([^"]*)"/) do |email, password|
  step "I go to the sign in page"
  step "I fill in \"user_login\" with \"#{email}\""
  step "I fill in \"user_password\" with \"#{password}\""
  step "I press \"log-in\""
  step "I should see \"Signed in successfully.\""
end

