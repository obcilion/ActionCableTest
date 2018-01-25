class ChatRoomChannel < ApplicationCable::Channel
  def subscribed
    stop_all_streams
    stream_from 'chat_room_channel'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    stop_all_streams
  end

  def speak(data)
    ActionCable.server.broadcast(
      'chat_room_channel',
      message: data['message']
    )
  end
end
