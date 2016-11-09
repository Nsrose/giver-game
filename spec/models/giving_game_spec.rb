require 'spec_helper'
require 'factory_girl'

RSpec.describe GivingGame, :type => :model do
    describe 'processes votes' do
        it 'should allow you to vote for charity a' do
            User.any_instance.stub(:add_to_giving_games)
            givingGame = FactoryGirl.build(:giving_game)
            givingGame.voteForA
            
            givingGame.votesA.should == 1
        end
        it 'should allow you to vote for charity b' do
            User.any_instance.stub(:add_to_giving_games)
            givingGame = FactoryGirl.build(:giving_game)
            givingGame.voteForB
            
            givingGame.votesB.should == 1
        end        
    end
    
    describe 'creation of a game' do
        it 'should allow you to create giving games' do
            givingParams = {:title => "title", :description => "description", 
            :total_money => 10.00, :per_transaction => 1.00, 
            :charity_a_id => 1,
            :charity_b_id => 2, 
            :tutorial => false, :show_results => true}
            givingGame = GivingGame.create(givingParams)
            givingGame.valid?.should be true
        end
        
        it 'should require the presence of the necessary fields' do 
            givingGame = GivingGame.create({:title => nil, :description => nil, 
            :total_money => nil, :per_transaction => nil, 
            :charity_a_id => nil, 
            :charity_b_id => nil})
            givingGame.valid?.should be false
            print givingGame.errors.messages
            print "\n"
        end
        
        it 'should require that the Total amount and the per transaction be numbers' do 
            givingGame = GivingGame.create({:total_money => 'aafb', :per_transaction => '*&3'})
            givingGame.valid?.should be false
            print givingGame.errors.messages
        end
    end
end