require 'spec_helper'
require 'factory_girl'

RSpec.describe GamesController, :type => :controller do
  login_user
  create_charity
  

  describe 'POST - /games/create SUCCESS' do
    it 'should redirect you to the home page' do 
      params = {:game => {:title => "title", :description => "description", 
            :total_money => 10.00, :per_transaction => 1.00, 
            :charity_a_id => 1,
            :charity_b_id => 2, 
            :tutorial => false, :default_charity_a => 1, :default_charity_b => 4}}
      post :create, params

      expect(response).to redirect_to(root_path)
    end
  end
  
  describe 'POST - /games/create FAILURE' do 
    it 'should redirect you to the create game page if the title is the same' do 
      params = {:game => {:title => "A Fake Title", :description => "description", 
            :total_money => 10.00, :per_transaction => 1.00, 
            :charityA_title => "charity A", :descriptionA => "description A", 
            :charityB_title => "charity B", :descriptionB => "description B", 
            :tutorial => false}}
      post :create, params
      post :create, params
      
      expect(response).to redirect_to(new_game_path)
    end
    
    it 'should redirect you to the create game page if the params are invalid' do
      params = {:game => {:title => nil, :description => nil, 
            :total_money => "NOT MONEY", :per_transaction => 1.00, 
            :charityA_title => "charity A", :descriptionA => "description A", 
            :charityB_title => "charity B", :descriptionB => "description B", 
            :tutorial => false}}
      post :create, params
      expect(response).to redirect_to(new_game_path)
    end
    
    it 'should add warning messages for invalid entries' do 
      User.any_instance.stub(:add_to_giving_games)
      params = {:game => {:title => nil, :description => nil, 
            :total_money => "ljkdf;awfw", :per_transaction => nil, 
            :charityA_title => nil, :descriptionA => nil, 
            :charityB_title => nil, :descriptionB => nil, 
            :tutorial => false}}
      post :create, params
      expect(controller).to set_flash[:danger]
    end
  end
  
end