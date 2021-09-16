class ChatroomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chatroom_channel"
    stream_from "room_channel_#{params['room_id']}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  
  def speak(data)
    # Message.create! content: data['message'], user_id: current_user.id
  var = Message.create!(content: data['message'],user_id: params['current_user.id'])  
  var.save
    # ActionCable.server.broadcast 'chatroom_channel' ,data['message']
  end
end
