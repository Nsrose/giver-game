class GameMailer < ApplicationMailer
  # include Singleton
  
  def game_finished_email(game)
    byebug
    @game = game
    @user = game.user
    @results_link = results_url(:resource_id => game.resource_id)
    @create_new_game_link = new_game_url
    mail(to: game.user.email, subject: 'Your Giving Game has ended!').deliver()
  end

end
