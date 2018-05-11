class MessagesController < ApplicationController
  protect_from_forgery :only => :destroy
  before_action :authenticate_user!
  before_action :set_chatroom

  def index
    
  end

  def new
    
  end

  def create
    message = @chatroom.messages.new(message_params)
    message.user = current_user
    message.save
    ActionCable.server.broadcast "chatrooms:#{@chatroom.id}",{
      message: MessagesController.render(message),
      chatroom_id: @chatroom.id
    }
  end

  private
    def set_chatroom
      @chatroom = Chatroom.find(params[:chatroom_id])
    end

    def message_params
      # byebug
      params.require(:message).permit(:body)
    end
end