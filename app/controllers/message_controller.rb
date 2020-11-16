class MessageController < ApplicationController
  before_action :authenticate_user!
  def show
    room = Room.find_by(id: params[:id])
    @room_user = room.room_users.where.not(user_id: current_user.id).first.user
    @messages = Message.where(room: room).order(:created_at)
    @message = Message.new
  end

  def create
    room_user = RoomUser.find_by(user_id: params[:format])
    @message = Message.new(message: params[:message][:message], room_id: room_user.room_id, user_id: current_user.id)
    @from_user = User.find_by(id: current_user.id)
    @to_user = User.find_by(id: room_user.user_id)
    ActionCable.server.broadcast 'message_channel', 
    content: @message, 
    from_user: @from_user.nickname 
    @message.save
  end
end
