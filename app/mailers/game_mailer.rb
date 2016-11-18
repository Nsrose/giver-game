class GameMailer < ApplicationMailer

  def game_finished_email(game)
    @game = game
    @user = game.user
    mail(to: game.user.email, subject: 'Your Giving Game has ended!')
  end

end
