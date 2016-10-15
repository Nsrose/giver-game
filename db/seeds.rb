
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