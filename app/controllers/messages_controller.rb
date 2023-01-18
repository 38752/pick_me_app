class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :room_participant?
  def index
    @object = @room.users.find_by("user_id != ?", current_user.id)
    @message = Message.new
  end

  def create
    @message = @room.messages.new(message_params)
    if @message.save
      redirect_to room_messages_path(@room)
    else
      @object = @room.users.find_by("user_id != ?", current_user.id)
      render :index
    end
  end

  private

  def room_participant?
    @room = Room.find(params[:room_id])
    unless @room.users.ids.include?(current_user.id)
      redirect_to root_path
    end
  end

  def message_params
    params.require(:message).permit(:content).merge(user_id: current_user.id)
  end
end
