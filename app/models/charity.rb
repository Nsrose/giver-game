class Charity < ActiveRecord::Base
  # names of charities should be unique
  validates :name, uniqueness: true
  
  # eins of charities should be unique
   validates :ein, uniqueness: true
  
  # needs titles for all of the titles of things.
  validates_presence_of :title, :charityA_title, :charityB_title, :total_money, :per_transaction

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