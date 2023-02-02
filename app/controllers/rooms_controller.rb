class RoomsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_room,       only: [:accept, :reject, :close]
  before_action :room_master?,   only: [:accept, :reject, :close]
  before_action :before_accept?, only: [:accept, :reject]
  before_action :room_open?,     only: [:close]
  def index
    @talking_rooms = current_user.rooms.where(room_status_index_id: 20).order("updated_at DESC")
    @unapproved_request_rooms = current_user.own_rooms.where(room_status_index_id: 10).includes(:users, :room_users).order("updated_at DESC")
  end

  def accept
    @room.update(room_status_index_id: 20)
    object = @room.users.find_by("user_id != ?", current_user.id)
    IndividualActivity.create(room_id: @room.id, object_id: object.id, category: 'accepted')
    redirect_to room_messages_path(@room)
  end

  def reject
    @room.update(room_status_index_id: 0)
    redirect_to rooms_path
  end

  def close
    @room.update(room_status_index_id: 99)
    redirect_to rooms_path
  end

  private

  def set_room
    @room = Room.find(params[:id])
  end

  def room_master?
    redirect_to rooms_path if @room.room_master != current_user
  end

  def before_accept?
    redirect_to rooms_path if @room.room_status_index_id != 10
  end

  def room_open?
    redirect_to rooms_path if @room.room_status_index_id != 20
  end
end
