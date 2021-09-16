class ChatroomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chatroom_channel"
    stream_from "chatroom_channel#{params['user_id']}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  
  def speak(data)
    # Message.create! content: data['message'], user_id: current_user.id
   Message.create!(content: data['message'], user_id: ['current_user.id']) 
    ActionCable.server.broadcast 'chatroom_channel' ,data['message']
  end
end
