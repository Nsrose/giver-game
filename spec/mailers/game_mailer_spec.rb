require "spec_helper"

RSpec.describe GameMailer, :type => :mailer do
  describe "game finished" do
    it "should send an email if the game is finished" do
      # Create the email and store it for further assertions
      game = GivingGame.create!(:title => 'Expired Game 1',
                         :description =>'This is an expired game',
                         :tutorial => false,
                         :show_results => false,
                         :expired => true,
                         :is_private => false,
                         :resource_id => "e1",
                         :charity_a_id => 3,
                         :charity_b_id => 1)
      user = User.create!(:password => 'lulzlulz',
                   :password_confirmation => 'lulzlulz',
                   :giving_games => GivingGame.all,
                   :email => 'jo@trader.com',
                   :username => 'Trader_Joe123')
      
      user.add_to_created_giving_games(game)

      email = GameMailer.game_finished_email(game)

      # Send the email, then test that it got queued
      assert_emails 1 do
        email.deliver_now
      end

      # Test the body of the sent email contains what we expect it to
      assert_equal ['no-reply@giver-game.com'], email.from
      assert_equal [game.user.email], email.to
      assert_equal 'Your Giving Game has ended!', email.subject
    end
  end
end
