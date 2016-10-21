class GivingGame < ActiveRecord::Base
  belongs_to :user
  #using two has_one associations since there will be strictly 2 charities, defined explicitly as A and B
  has_one :charity_a, :class_name => 'Charity', :foreign_key => :charity_a_id
  has_one :charity_b, :class_name => 'Charity', :foreign_key => :charity_b_id

  # titles of giving games should be unique
  validates :title, uniqueness: true
  #can't choose teh same charity twice
  validates :charity_a, uniqueness: {scope: :charity_b}
  validates :charity_b, uniqueness: {scope: :charity_a}

  
  # resource_id of giving games should be unique
  # validates :resource_id, uniqueness: true
  
  # money valuse should be greater than or equal to 0 and numbers
  validates :total_money, :numericality => { :greater_than_or_equal_to => 0 }
  validates :per_transaction, :numericality => { :greater_than_or_equal_to => 0 }
  # needs titles for all of the titles of things.
  validates_presence_of :title, :charityA_title, :charityB_title, :total_money, :per_transaction

  mount_uploader :charityA_image, CharityAImageUploader
  mount_uploader :charityB_image, CharityBImageUploader
  
  # def initialize(args)
  #   super(args)
  #   if self.is_private?
  #     write_attribute(:resource_id, SecureRandom.hex)
  #   else
  #     write_attribute(:resource_id, self.id)
  #   end
  # end
  
  # def create(args)
  #   super(args)
  #   if self.is_private?
  #     p self
  #     write_attribute(:resource_id, SecureRandom.hex)
  #   else
  #     write_attribute(:resource_id, self.id)
  #   end
  # end
  
  def voteForA
    self.votesA += 1
    self.save
  end
    
  def voteForB
    self.votesB += 1
    self.save
  end
end