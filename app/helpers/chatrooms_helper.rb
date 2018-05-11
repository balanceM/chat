module ChatroomsHelper
  def join?(chatroom)
    current_user && current_user.chatrooms.include?(chatroom)
  end
end
