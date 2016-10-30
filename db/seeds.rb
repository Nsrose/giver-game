
games = [{:title => 'Tutorial1', :description =>'This is the tutorial for the Giving Game', :charityA_title => 'Against Malaria Foundation', :charityB_title => 'Give Directly', :tutorial => true, :show_results => true, :is_private => false, :resource_id => "t1"},
        {:title => 'Tutorial2', :description =>'This is the second tutorial for the Giving Game', :charityA_title => 'Charity A', :charityB_title => 'Charity B', :tutorial => true, :show_results => true, :is_private => false, :resource_id => "t2"},
        {:title => 'Game 1', :description =>'This is not a tutorial', :charityA_title => 'Charity A', :charityB_title => 'Charity B', :tutorial => false, :show_results => true, :is_private => false, :resource_id => "nt1"},
        {:title => 'Expired Game 1', :description =>'This is an expired game', :charityA_title => 'Charity 1', :charityB_title => 'Charity 2', :tutorial => false, :show_results => false, :expired => true, :is_private => false, :resource_id => "e1"},
        {:title => 'Expired Game 2', :description =>'This is also an expired game', :charityA_title => 'Charity Uno', :charityB_title => 'Charity Dos', :tutorial => false, :show_results => false, :expired => true, :is_private => false, :resource_id => "e2"},
        {:title => 'Expired Game 3', :description =>'This is the last expired game', :charityA_title => 'Charity One', :charityB_title => 'Charity Two', :tutorial => false, :show_results => true, :expired => true, :is_private => false, :resource_id => "e3"}]
games.each do |game|
    GivingGame.create!(game)
end

user = User.create! :email => 'jo@trader.com', :password => 'lulzlulz', :password_confirmation => 'lulzlulz', :username => 'Trader_Joe123', :giving_games => GivingGame.all

malaria_description = 'Malaria is one of the leading killers of children in Africa.
But with insecticide-treated bed nets we can prevent deaths and 
many other non-fatal cases of malaria
We protect people throughout sub-Saharan Africa from malaria.
We fund nets and ensure they are distributed and used.
We show you where the nets go. We monitor and report their use and impact.'
                        
sci_description = '500 million people throughout sub-Saharan Africa suffer from Neglected Tropical Diseases (NTD),
but a solution is within reach. For 30pence/50cents, an individual can receive treatment
for all seven of the most common NTDs for an entire year.\n 
The problem is big, but together even the smallest of donations will make a significant impact
in controlling NTDs and reducing global poverty.'

deworm_description = 'Over 870 million preschool- and school-age children are at risk of parasitic worm infection. 
Over 600 million of these children remain untreated. The Deworm the World Initiative works with governments
around the world to develop and implement national school-based deworming programs. 
These leverage existing infrastructure, result in treatment coverage of over 80% of at-risk
children, and reduce costs to less than USD 50 cents per child per year.'

giveDirectly_description = 'GiveDirectly transfers cash to households in developing countries via mobile
phone-linked payment services. We target extremely low-income households.
We aim to reshape international giving, making direct transfers to the poor the
benchmark against which other, more expensive approaches are evaluated.' 
                        
charities = [{:name => 'Against Malaria Foundation', :description => malaria_description, :ein => '20-3069841', :image_link => 'https://www.againstmalaria.com/images/logo_AMF.gif', :homepage_link => 'https://www.againstmalaria.com/Default.aspx', :donation_link => 'https://www.againstmalaria.com/donate.aspx?GroupID=81'},
             {:name => 'Schistosomiasis Control Initiative (SCI)', :description => sci_description, :ein => '20-8625442', :image_link => 'http://www3.imperial.ac.uk/newseventsimages?p_image_type=mainnews2012&p_image_id=35469', :homepage_link => 'https://www.imperial.ac.uk/schistosomiasis-control-initiative', :donation_link => 'http://www.imperial.ac.uk/schistosomiasis-control-initiative/donate/'}, 
             {:name => 'Deworm the World Initiative', :description => deworm_description, :ein => '26-3455539', :homepage_link => 'http://www.evidenceaction.org/dewormtheworld/', :donation_link => 'https://give.evidenceaction.org'},
             {:name => 'GiveDirectly', :description => 'giveDirectly_description', :ein => '27-1661997', :image_link => 'https://cdn.givedirectly.org/8fa1cf088be076b2943084a6efe2b7ab/basic-income-link.jpg', :homepage_link => 'https://www.givedirectly.org', :donation_link => 'https://www.givedirectly.org/give-now'}
             ]

charities.each do |game|
    Charity.create!(game)
end