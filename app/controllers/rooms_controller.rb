class RoomsController < ApplicationController
  before_action :authenticate_user!
  def index
    # binding.pry
    @talking_rooms = current_user.rooms.where(room_status_index_id: 20).order("updated_at DESC")
    @unapproved_request_rooms = current_user.own_rooms.where(room_status_index_id: 10).includes(:users, :room_users).order("updated_at DESC")
  end
end
