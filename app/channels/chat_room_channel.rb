class ChatRoomChannel < ApplicationCable::Channel
  def subscribed
    stop_all_streams
    stream_from 'ChatRoomChannel'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    stop_all_streams
  end

  def speak(data)
    ActionCable.server.broadcast(
      'ChatRoomChannel',
      data['message']
    )
  end
end
