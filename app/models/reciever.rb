class Reciever < ApplicationRecord
    has_many :messages
    has_many :senders, through: :messages, dependent: :destroy
end
