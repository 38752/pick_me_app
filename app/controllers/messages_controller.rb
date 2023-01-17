class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :room_participant?
  def index
    @message = Message.new
  end

  private

  def room_participant?
    @room = Room.find(params[:room_id])
    unless @room.users.ids.include?(current_user.id)
      redirect_to root_path
    end
  end
end
