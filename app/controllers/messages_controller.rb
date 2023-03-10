class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :room_participant?
  before_action :set_extras
  def index
    @individual_activities = IndividualActivity.where(room_id: @room.id, object_id: current_user.id)
    @individual_activities.each do |individual_activity|
      individual_activity.update(read: true)
    end
    @message = Message.new
  end

  def create
    @message = @room.messages.new(message_params)
    if @message.save
      IndividualActivity.create(room_id: @room.id, object_id: @object.id, category: 'message')
    end
    redirect_to room_messages_path(@room)
  end

  private

  def room_participant?
    @room = Room.find(params[:room_id])
    unless @room.users.ids.include?(current_user.id)
      redirect_to root_path
    end
  end

  def set_extras
    @messages = @room.messages.order("created_at ASC")
    @object = @room.users.find_by("user_id != ?", current_user.id)
    @hit_on = @room.hit_on
    @hima = @hit_on.hima
  end

  def message_params
    params.require(:message).permit(:content).merge(user_id: current_user.id)
  end
end
