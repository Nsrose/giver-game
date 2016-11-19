require "spec_helper"

RSpec.describe GameMailer, :type => :mailer do
  describe "game finished" do
    it "should send an email if the game is finished" do
      # Create the email and store it for further assertions
      charities = [
          {
              :name => 'Against Malaria Foundation',
              :description => "blah",
              :ein => '20-3069841',
              :image_link => 'http://www.againstmalaria.com/images/logo_AMF_Square.png',
              :homepage_link => 'https://www.againstmalaria.com/Default.aspx',
              :donation_link => 'https://www.againstmalaria.com/donate.aspx?GroupID=81'
          },
          {
              :name => 'Schistosomiasis Control Initiative (SCI)',
              :description => "blah",
              :ein => '20-8625442',
              :image_link => 'http://www.goodventures.org/images/grants/SCI-treatment.jpeg',
              :homepage_link => 'https://www.imperial.ac.uk/schistosomiasis-control-initiative',
              :donation_link => 'http://www.imperial.ac.uk/schistosomiasis-control-initiative/donate/'
          }
      ]
      charity_a = Charity.create!(charities[0])
      charity_b = Charity.create!(charities[1])
      game = GivingGame.create!(:title => 'Expired Game 1',
                         :description =>'This is an expired game',
                         :tutorial => false,
                         :show_results => false,
                         :expired => true,
                         :is_private => false,
                         :resource_id => "e1",
                         :charity_a_id => charity_a.id,
                         :charity_b_id => charity_b.id)
      user = User.create!(:password => 'lulzlulz',
                   :password_confirmation => 'lulzlulz',
                   :giving_games => GivingGame.all,
                   :email => 'jo@trader.com',
                   :username => 'Trader_Joe123')

      user.add_to_created_giving_games(game)

      email = GameMailer.game_finished_email(game)

      # # Send the email, then test that it got queued
      # assert_emails 1 do
      #   email.deliver_now
      # end

      # Test the body of the sent email contains what we expect it to
      assert_equal ['givinggamenoreply@gmail.com'], email.from
      assert_equal [game.user.email], email.to
      assert_equal 'Your Giving Game has ended!', email.subject
    end
  end
end
