class RoomsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_room, only: [:accept, :reject]
  before_action :room_master?, only: [:accept, :reject]
  before_action :normal_status?, only: [:accept, :reject]
  def index
    # binding.pry
    @talking_rooms = current_user.rooms.where(room_status_index_id: 20).order("updated_at DESC")
    @unapproved_request_rooms = current_user.own_rooms.where(room_status_index_id: 10).includes(:users, :room_users).order("updated_at DESC")
  end

  def accept
    @room.update(room_status_index_id: 20)
    redirect_to room_messages_path(@room)
  end

  def reject
    @room.update(room_status_index_id: 0)
    redirect_to rooms_path
  end

  private

  def set_room
    @room = Room.find(params[:id])
  end

  def room_master?
    redirect_to rooms_path if @room.room_master != current_user
  end

  def normal_status?
    redirect_to rooms_path if @room.room_status_index_id != 10
  end
end
