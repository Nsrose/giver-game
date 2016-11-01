require 'securerandom'

class GamesController < ApplicationController

  def game_params
    params.require(:game).permit(:title,
                                 :is_private,
                                 :resource_id,
                                 :description,
                                 :total_money,
                                 :per_transaction,
                                 :charityA_title,
                                 :descriptionA,
                                 :charityB_title,
                                 :descriptionB,
                                 :expiration_time,
                                 :tutorial,
                                 :show_results,
                                 :charityA_image,
                                 :charityB_image,
                                 :charityA_image_cache,
                                 :charityB_image_cache)
  end
  
  def home
  end

  def new
    if current_user.nil?
      flash[:warning] = "You must be logged in to create a new giving game."
      redirect_to new_user_session_path
    end
    @defaultCharities = Charity.all
    @game = GivingGame.new(session[:game]) || GivingGame.new()
    if session and session.key? :game
      session.delete(:game)
    end
  end
  
  def edit
    @defaultCharities = Charity.all
    if session and session[:game]
      @game = GivingGame.new(session[:game])
      @game.resource_id = params[:resource_id]
      session.delete :game
    else
      @game = GivingGame.where(:resource_id => params[:resource_id])[0]
    end
  end
  
  def update
    game = GivingGame.where(:resource_id => params[:resource_id]).first
    gp = game_params
    begin 
      if gp[:expiration_time]
        if gp[:expiration_time] == ''
          gp[:expiration_time] = nil
        else
          gp[:expiration_time] = Date.strptime(gp[:expiration_time], "%m/%d/%Y")
        end
      end
    rescue
        flash[:danger] = "Invalid date passed"
        redirect_to user_profile_path(current_user.id)
        return
    end
    game.assign_attributes(gp)
    if game.valid?
      GivingGame.update(game.id, gp)
      flash[:success] = "Successfully edited."
      redirect_to user_profile_path(current_user.id)
    else
      totalMessage = ""
      game.errors.messages.each do |key, message|
        if params.key? key 
          params.delete key  
        end
        totalMessage += "#{key.to_s().gsub('_', ' ').capitalize} #{message.join("', and'")}; "
      end
      flash[:danger] = totalMessage
      session[:game] = params[:game]
      redirect_to edit_game_path(current_user.id, params[:resource_id])
    end
  end

  def create
    success = true
    gp = game_params
    begin 
      if gp[:expiration_time]
        if gp[:expiration_time] == ''
          gp[:expiration_time] = nil
        else
          gp[:expiration_time] = Date.strptime(gp[:expiration_time], "%m/%d/%Y")
        end
      end
    rescue
        flash[:danger] = "Invalid date passed"
        redirect_to new_game_path
        return
    end

    game = GivingGame.new(gp)

    if game.valid?
      game.save() ## need to have game in database in order to have an id
      if game.is_private?
        game.resource_id =  SecureRandom.hex
      else
        game.resource_id =  game.id
      end
      
      game.save()

      @game = game
      message = "Giving Game #{@game.title} successfully created."
      if game.is_private
        full_game_url = "#{request.host_with_port}/games/play/#{game.resource_id}"
        message += " Your private game URL: " + full_game_url
      end
      flash[:success] = message
      current_user.add_to_created_giving_games(game)
    else
      totalMessage = ""
      game.errors.messages.each do |key, message|
        if params[:game].key? key
          params[:game].delete(key)
        end
        totalMessage += "#{key.to_s().gsub('_', ' ').capitalize} #{message.join("', and'")}; "
      end
      flash[:danger] = totalMessage
      session[:game] = params[:game]
      success = false
    end
    if success
      redirect_to root_path
    else
      redirect_to new_game_path
    end
    
  end

  def play_index
    @games = GivingGame.where("expired = ? AND (expiration_time > ? OR expiration_time IS NULL)", false, DateTime.now)
    @games = @games.where(:is_private => false)
    @counter = @games.length
    @charityVotedFor = params[:charity]
  end
  
  def play_game
    chosen_game = GivingGame.where(:resource_id => params[:resource_id])[0]

    if current_user.nil? and !chosen_game.tutorial?
      flash[:warning] = "You must be logged in to play an actual giving game."
      redirect_to new_user_session_path
    else
      @game = chosen_game
      @charityA = @game.charityA_title
      @charityB = @game.charityB_title
      @description = @game.description
      @title = @game.title
      @descriptionA = @game.descriptionA
      @descriptionB = @game.descriptionB
      @showResults = @game.show_results
      if @game.expiration_time?
        @expiration_time = @game.expiration_time.strftime("%m/%d/%Y")
      else
        @expiration_time = 'None'
      end
      @tutorial = @game.tutorial
    end
  end

  def tutorial
    number_of_games = GivingGame.where(:tutorial => true).count
    index = rand(number_of_games)
    games = GivingGame.where(:tutorial => true).collect{|i| i}
    redirect_to play_game_path(:resource_id => games[index].resource_id)
  end
  
  def check_if_played_and_reroute
    game = GivingGame.find(params[:id])
    
    if !game.tutorial
      if current_user.present? and current_user.played_games.include? game.id
        flash[:warning] = "You have already played that game."
        redirect_to play_index_path and return
      else
          current_user.add_to_played_giving_games(game)
      end
    end

    charityA = game.charityA_title
    charityB = game.charityB_title
    charity = params[:charity]
    if charity == charityA
      game.voteForA
    elsif charity == charityB
      game.voteForB
    end
    total_moneyA = game.votesA * game.per_transaction
    total_moneyB = game.votesB * game.per_transaction
    money_allowed = game.total_money
    if money_allowed <= total_moneyA + total_moneyB
      if !game.tutorial
        game.expired = true
        game.save
      end
    end
    if game.show_results == true
      redirect_to results_path(:resource_id => game.resource_id, :charity => charity)
    else
      redirect_to play_index_path(:charity => charity)
    end
  end
  
  def archive
    @games = GivingGame.where("expired = ? OR expiration_time < ?", true, DateTime.now)
    @counter = @games.length
  end
  
  def archive_game
      @game = GivingGame.where(:resource_id => params[:resource_id])[0]
      @charityA = @game.charityA_title
      @charityB = @game.charityB_title
      @description = @game.description
      @title = @game.title
      @descriptionA = @game.descriptionA
      @descriptionB = @game.descriptionB
      @showResults = @game.show_results
  end
  
  def results
    @game = GivingGame.where(:resource_id => params[:resource_id]).first
    @owner = @game.user_id
    @expired = @game.expired
    @charityVotedFor = params[:charity]
    @title = @game.title
    @charityA = @game.charityA_title
    @charityB = @game.charityB_title
    @votesA = @game.votesA
    @votesB = @game.votesB
    @current_moneyA = @votesA * @game.per_transaction
    @current_moneyB = @votesB * @game.per_transaction
    @total_money = @game.total_money
    @votes_progressA = (@current_moneyA / @total_money) * 100
    @votes_progressB = (@current_moneyB / @total_money) * 100
    
    # show which charity is in the lead
    if @votesA > @votesB
      @leadingCharity = @charityA
    elsif @votesA < @votesB
      @leadingCharity = @charityB
    else
      @leadingCharity = nil
    end
  end
  
  
  
end