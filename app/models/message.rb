class Message < ApplicationRecord
    belongs_to :sender, optional: true
    belongs_to :reciever, optional: true

    validates :content, uniqueness: true, on: :create
    validates :created_at, uniqueness: true, on: :create
end
