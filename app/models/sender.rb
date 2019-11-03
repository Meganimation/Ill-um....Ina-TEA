class Sender < ApplicationRecord
    has_many :messages
    has_many :recievers, through: :messages, dependent: :destroy
    
    validates :facebook_id, uniqueness: true, on: :create

  


end
