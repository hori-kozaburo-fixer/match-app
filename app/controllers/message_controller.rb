class ChatMessageController < ApplicationController
  before_action :authenticate_user!
  def show
    room = Room.find_by(id: params[:id])
    @room_user = room.room_users.where.not(user_id: current_user.id).first.user
    @chat_messages = ChatMessage.where(room: room).order(:created_at)
    @chat_message = ChatMessage.new
  end

  def create
    @chat_message = ChatMessage.new(text: params[:message][:text])
  end
end
