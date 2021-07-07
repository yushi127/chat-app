class ChatroomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chatroom_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  
  
  def speak(data)
   message = Message.create!(content: data['message'], user_id: data['user_id'])
    template = ApplicationController.render_with_signed_in_user(partial: 'messages/message', locals:{message: message})
    ActionCable.server.broadcast 'chatroom_channel',template
  end
end
