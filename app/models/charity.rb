class Charity < ActiveRecord::Base
  #explicitly stating the fields within game that two charity models will belong to 
  #because otherwise it would simply do charity_id when we want an id for both a and b
  #belongs_to :charity_a, :class_name => "GivingGame", :foreign_key => :charity_a_id
  #belongs_to :charity_b, :class_name => "GivingGame", :foreign_key => :charity_b_id

  # names of charities should be unique
  validates :name, uniqueness: true
  
  # eins of charities should be unique
   validates :ein, uniqueness: true
  
  # needs name/ein for all of the titles of things.
  validates_presence_of :name, :ein

  mount_uploader :image, CharityImageUploader

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

end