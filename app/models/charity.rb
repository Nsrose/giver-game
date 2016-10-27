class Charity < ActiveRecord::Base
    validates :name, presence: true
    validates :ein, presence: true
    validates :donation_link, presence: true

end