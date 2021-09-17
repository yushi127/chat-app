class Message < ApplicationRecord
    belongs_to :room, foreign_key: 'room_id',optional: true

   
    # def messages
    #   return Message.where(user_id: self.id)
    end