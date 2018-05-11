class ChatroomUsersController < ApplicationController
  before_action :set_chatroom

  def create
    @chatroom_user = @chatroom.chatroom_users.where(user_id: current_user.id).first_or_create
    conn = ActionCable.server.connections.first { |c| c.current_user == user_id }
    puts "=============================="
    # ChatroomsChannel.new(conn, "made up id").stream_from "chatrooms:#{@chatroom.id}"
    respond_to do |format|
      format.html {redirect_to @chatroom}
      format.js   {render :layout => false }
    end
  end

  def destroy
    @chatroom_user = @chatroom.chatroom_users.where(user_id: current_user.id).destroy_all
    # redirect_to chatrooms_path
    respond_to do |format|
      format.html {redirect_to chatrooms_path}
      format.js   {render :layout => false }
    end
  end

  private
    def set_chatroom
      @chatroom = Chatroom.find(params[:chatroom_id])
    end
end