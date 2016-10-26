# TL;DR: YOU SHOULD DELETE THIS FILE
#
# This file is used by web_steps.rb, which you should also delete
#
# You have been warned
module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /^the home\s?page$/
      '/'
      
    when /^the existing games page$/
      play_index_path
    when /^the tutorial page$/
      resource_id = GivingGame.where(:title => "Tutorial").first.resource_id
      play_game_path(resource_id)
    when /^the new games page$/
      new_game_path
    when /^the results page for "([^"]*)"$/
      resource_id = GivingGame.where(:title => $1).first.resource_id
      results_path(resource_id)
    when /^the game page for "([^"]*)"$/
      resource_id = GivingGame.where(:title => $1).first.resource_id
      play_game_path(resource_id)
    when /^the sign in page$/
      new_user_session_path
    when /^the sign up page$/
      new_user_registration_path
    when /^the user page for "([^"]*)"$/
      id = User.where(:email => $1).first.id
      user_profile_path(id)
    when /^the edit page for "([^"]*)"$/
      game = GivingGame.where(:title => $1).first
      edit_game_path(game.user_id, game.resource_id)
    when /^the archive page$/
      archive_path
    when /^the expired game info page for "([^"]*)"$/
      resource_id = GivingGame.where(:title => $1).first.resource_id
      archive_game_path(resource_id)
    when /^the charities page$/
      charity_index_path
    when /^the new charity page$/
      charity_new_path
    when /^the edit charity page for "([^"])"$/
      charity_id = Charity.where(:name => $1)
      charity_edit_path(charity_id)

    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
