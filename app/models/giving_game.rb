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


  mount_uploader :charityA_image, CharityAImageUploader
  mount_uploader :charityB_image, CharityBImageUploader
  
  def check_charities_not_equal
    errors.add("Charities", "A and B must be different") if self.charity_a_id == self.charity_b_id
  end
  
  def generate_error_message()
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

  def total_moneyA
    self.votesA * self.per_transaction
  end

  def total_moneyB
    self.votesB * self.per_transaction
  end

  def check_total_money
    if self.total_money <= self.total_moneyA + self.total_moneyB
      if !self.tutorial
        self.expired = true
        self.save
      end
    end
  end
end