class Message < ApplicationRecord
    belongs_to :user, foreign_key: 'room_id',optional: true

   
    # def messages
    #   return Message.where(user_id: self.id)
    end