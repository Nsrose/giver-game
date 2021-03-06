malaria_description = 'Malaria is one of the leading killers of children in Africa.
But with insecticide-treated bed nets we can prevent deaths and
many other non-fatal cases of malaria
We protect people throughout sub-Saharan Africa from malaria.
We fund nets and ensure they are distributed and used.
We show you where the nets go. We monitor and report their use and impact.'

sci_description = '500 million people throughout sub-Saharan Africa suffer from Neglected Tropical Diseases (NTD),
but a solution is within reach. For 30pence/50cents, an individual can receive treatment
for all seven of the most common NTDs for an entire year.
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

charities = [
    {
        :name => 'Against Malaria Foundation',
        :description => malaria_description,
        :ein => '20-3069841',
        :image_link => 'http://www.againstmalaria.com/images/logo_AMF_Square.png',
        :homepage_link => 'https://www.againstmalaria.com/Default.aspx',
        :donation_link => 'https://www.againstmalaria.com/donate.aspx?GroupID=81'
    },
    {
        :name => 'Schistosomiasis Control Initiative (SCI)',
        :description => sci_description, 
        :ein => '20-8625442',
        :image_link => 'http://www.goodventures.org/images/grants/SCI-treatment.jpeg',
        :homepage_link => 'https://www.imperial.ac.uk/schistosomiasis-control-initiative',
        :donation_link => 'http://www.imperial.ac.uk/schistosomiasis-control-initiative/donate/'},
    {
        :name => 'Deworm the World Initiative',
        :description => deworm_description, 
        :ein => '26-3455539',
        :image_link => 'http://altruismoeficaz.info/wp-content/uploads/2015/07/deworm_logo.jpg',
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
    }
]

charities.each do |charity|
  existing_charity = Charity.where(:name => charity[:name])
  if existing_charity.present?
    existing_charity = existing_charity.first
    existing_charity.update_attributes!(charity)
  else
    Charity.create!(charity)
  end
end

charA = Charity.all[0].id
charB = Charity.all[1].id

games = [
    {
        :title => 'Tutorial1',
        :description =>'This is the tutorial for the Giving Game',
        :tutorial => true,
        :show_results => true,
        :is_private => false,
        :resource_id => "t1",
        :charity_a_id => 1,
        :charity_b_id => 4
    },
    {
        :title => 'Tutorial2',
        :description =>'This is the second tutorial for the Giving Game',
        :tutorial => true,
        :show_results => true,
        :is_private => false,
        :resource_id => "t2",
        :charity_a_id => 2,
        :charity_b_id => 4
    },
    {
        :title => 'Game 1',
        :description =>'This is not a tutorial',
        :tutorial => false,
        :show_results => true,
        :is_private => false,
        :resource_id => "nt1",
        :charity_a_id => 4,
        :charity_b_id => 3
    },
    {
        :title => 'Expired Game 1',
        :description =>'This is an expired game',
        :tutorial => false,
        :show_results => false,
        :is_private => false,
        :resource_id => "e1",
        :charity_a_id => 3,
        :charity_b_id => 1,
        :expired => true,

    },
    {
        :title => 'Expired Game 2',
        :description =>'This is also an expired game',
        :tutorial => false,
        :show_results => false,
        :is_private => false,
        :resource_id => "e2",
        :charity_a_id => 3,
        :charity_b_id => 2,
        :expired => true,
    },
    {
        :title => 'Expired Game 3',
        :description =>'This is the last expired game',
        :tutorial => false,
        :show_results => true,
        :is_private => false,
        :resource_id => "e3",
        :charity_a_id => 2,
        :charity_b_id => 1,
        :expired => true,
    }
]


# games.each do |game|
#     GivingGame.where(game).first_or_create! # This is causing issues
# end

games.each do |game|
    existing_game = GivingGame.where(:title => game[:title])
    if existing_game.present?
      existing_game = existing_game.first
      existing_game.update_attributes!(game)
    else
      GivingGame.create!(game)
    end
end


user_obj = {
    :password => 'lulzlulz',
    :password_confirmation => 'lulzlulz',
    :giving_games => GivingGame.all,
    :email => 'jo@trader.com',
    :username => 'Trader_Joe123'
}

admin_obj = {
    :email => 'admin@givinggame.com',
    :password => 'gameadmin123',
    :password_confirmation => 'gameadmin123',
    :username => 'Admin',
    :giving_games => GivingGame.all,
    :is_admin => true
}

existing_user = User.where(:email => user_obj[:email])
if existing_user.present?
  existing_user = existing_user.first
  existing_user.update_attributes!(user_obj)
else
  User.create!(user_obj)
end

existing_admin = User.where(:email => admin_obj[:email])
if existing_admin.present?
  existing_admin = existing_admin.first
  existing_admin.update_attributes!(admin_obj)
else
  User.create!(admin_obj)
end
