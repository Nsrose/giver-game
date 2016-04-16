class GamesController < ApplicationController

  def game_params
    params.require(:game).permit(:title, :description, :total_money, :per_transaction, :charityA_title, :descriptionA, :charityB_title, :descriptionB, :tutorial, :show_results, :image)
  end
  
  def home
  end

  def new
    if current_user.nil?
      flash[:warning] = "You must be logged in to create a new giving game."
      redirect_to new_user_session_path
    end
  end
  
  def edit
    @game = GivingGame.find(params[:id])
  end
  
  def update
    existing_game = GivingGame.find_by title: params[:game][:title]
    @game = GivingGame.find params[:id]
    if existing_game and @game.id != existing_game.id
      flash[:notice] = "The title #{params[:game][:title]} is already taken."
      redirect_to edit_game_path(current_user.id, params[:id])
    else
      @game.assign_attributes(game_params)
      if @game.valid?
        @game.save
        flash[:notice] = "Successfully edited."
        redirect_to user_profile_path(current_user.id)
      else
        totalMessage = "There were the following errors: \n"
        @game.errors.messages.each do |key, message|
          totalMessage += "#{key}: #{message} \n"
        end
        flash[:warning] = totalMessage
        redirect_to user_profile_path(current_user.id)
      end
    end
  end
  
  def create
    success = true 
    game = GivingGame.create(game_params)
    if game.valid?
      @game = game
      flash[:notice] = "Giving Game #{@game.title} successfully created."
      current_user.add_to_giving_games(game)
    else
      totalMessage = "There were the following errors: \n"
      game.errors.messages.each do |key, message|
        totalMessage += "#{key}: #{message} \n"
      end
      flash[:warning] = totalMessage
      success = false
    end
    
    if success
      redirect_to root_path
    else
      redirect_to new_game_path
    end
  end

  def play_index
    @games = GivingGame.where('expiration_time > ? or expiration_time IS NULL', DateTime.now)
    @counter = @games.length
    @charityVotedFor = params[:charity]
  end
  
  def play_game
    @game = GivingGame.find(params[:id])
    @charityA = @game.charityA_title
    @charityB = @game.charityB_title
    @description = @game.description
    @title = @game.title
    @descriptionA = @game.descriptionA
    @descriptionB = @game.descriptionB
    @showResults = @game.show_results
  end

  def tutorial
    number_of_games = GivingGame.where(:tutorial => true).count
    index = rand(number_of_games)
    games = GivingGame.where(:tutorial => true).collect{|i| i}
    @game = games[index]
    @charityA = @game.charityA_title
    @charityB = @game.charityB_title
    @description = @game.description
    @showResults = @game.show_results
  end
  
  def results
    @game = GivingGame.find(params[:id])
    @charityVotedFor = params[:charity]
    @title = @game.title
    @charityA = @game.charityA_title
    @charityB = @game.charityB_title
    
    if @charityVotedFor == @charityA
      @game.voteForA
    else
      @game.voteForB
    end
    
    @votesA = @game.votesA
    @votesB = @game.votesB
    
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