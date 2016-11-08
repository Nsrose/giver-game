class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validate :validate_username

  validates :username,
  :presence => true,
  :uniqueness => {
    :case_sensitive => false
  }  
  has_many :giving_games
  attr_accessor :login
  serialize :played_games,Array

  def has_played_game?(game)
    self.present? and self.played_games.include? game.id
  end
  
  def add_to_created_giving_games(game)
    self.giving_games << game
    self.save
  end

  def add_to_played_giving_games(game)
    self.played_games << game.id
    self.save
  end
  
  def validate_username
    if User.where(email: username).exists?
      errors.add(:username, :invalid)
    end
  end
  
  def self.find_for_database_authentication(warden_conditions)
      conditions = warden_conditions.dup
      if login = conditions.delete(:login)
        where(conditions.to_hash).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
      elsif conditions.has_key?(:username) || conditions.has_key?(:email)
        where(conditions.to_hash).first
      end
  end
  
end
