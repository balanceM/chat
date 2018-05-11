class ChatroomsChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    current_user.chatrooms.each do |chatroom|
      stream_from "chatrooms:#{chatroom.id}"
    end
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    stop_all_streams
  end

  def send_message(data)
    Rails.logger.info "======================="
    Rails.logger.info data
    @chatroom = Chatroom.find(data["chatroom_id"])
    message = @chatroom.messages.create(body: data["body"], user: current_user)
    MessageRelayJob.perform_later(message)
  end
end
