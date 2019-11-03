class Message < ApplicationRecord
    belongs_to :sender, optional: true
    belongs_to :reciever, optional: true
end
