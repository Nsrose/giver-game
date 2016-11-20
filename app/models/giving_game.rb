require 'game_mailer'
class GivingGame < ActiveRecord::Base
  belongs_to :user
  belongs_to :charity_a, :class_name => 'Charity'
  belongs_to :charity_b, :class_name => 'Charity'

  # titles of giving games should be unique
  validates :title, uniqueness: true
  
  # resource_id of giving games should be unique
  # validates :resource_id, uniqueness: true
  
  # money valuse should be greater than or equal to 0 and numbers
  validates :total_money, :numericality => { :greater_than_or_equal_to => 0 }
  validates :per_transaction, :numericality => { :greater_than_or_equal_to => 0 }
  # needs titles for all of the titles of things.
  validates_presence_of :title, :total_money, :per_transaction
  validate :check_charities_not_equal
  
  validate :per_transaction_total_money

  mount_uploader :charityA_image, CharityAImageUploader
  mount_uploader :charityB_image, CharityBImageUploader
  
  def per_transaction_total_money
    errors.add("", "Goal Amount of Money to Reach must be a multiple of Per Person Amount") if self.total_money%self.per_transaction != 0
  end
  
  def check_charities_not_equal
    errors.add("Charities ", "A and B must be different") if self.charity_a_id == self.charity_b_id
  end
  
  def generate_error_message()
    totalMessage = ""
      self.errors.messages.each do |key, message|
        totalMessage += "#{key.to_s().tr('_', ' ').capitalize} #{message.join(" and ")}. "
      end
    return totalMessage
  end
      
  def current_moneyA
    self.votesA * self.per_transaction
  end
  
  def current_moneyB
    self.votesB * self.per_transaction
  end
  
  def votes_progressA
    (self.current_moneyA / self.total_money) * 100
  end
  
  def votes_progressB
    (self.current_moneyB / self.total_money) * 100
  end

  def leadingCharity
    if self.votesA > self.votesB
      return self.charity_a
    elsif self.votesA < self.votesB
      return self.charity_b
    else
      return nil
    end
  end
  
  def vote(charity)
    if charity == self.charity_a_id
      self.voteForA
    elsif charity == self.charity_b_id
      self.voteForB
    end
  end
 
  def voteForA
    self.votesA += 1
    self.save
  end
    
  def voteForB
    self.votesB += 1
    self.save
  end

  def goal_reached?
    (self.total_money <= self.current_moneyA + self.current_moneyB) and !self.tutorial
  end

  def expired_before_goal?
    !self.goal_reached? and self.expired
  end

  def check_total_money
    if self.goal_reached?
      self.expired = true
      self.save
    end
  end
  
  def expired= (bool)
    if (self.expired == false) && (bool ==true)
      self.send_email
    end
    write_attribute(:expired, bool)

  end
  
 def self.expire_games
    games = GivingGame.where("expired = ? AND expiration_time <= ?", false, DateTime.now)
    games.each do |game|
      game.expired = true
      game.save!
    end
  end
    

  def send_email
    GameMailer.game_finished_email(self).deliver_now()
  end
end