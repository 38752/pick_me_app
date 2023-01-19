class HitOnsController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  # ↑createの際は、エラー内容をjsonで返すため照合不要

  def index
    @hit_ons = HitOn.where(user_id == current_user.id).includes(:user, :room, :messages, :room_master).order("id DESC")
  end

  def create
    hit_on_and_errors = {hit_on: nil, errors: nil}
    hit_on = HitOn.new(hit_on_params)
    relationship = Relationship.find_by(subject_id: hit_on.user_id, object_id: hit_on.hima_owner_id)

    if hit_on.save
      hit_on_and_errors[:hit_on] = hit_on
      if relationship == nil
        Relationship.create(subject_id: hit_on.user_id, object_id: hit_on.hima_owner_id)
      elsif relationship.relationship_index_id < 1000
        relationship.update(relationship_index_id: 1000)
      end
      room = Room.create(hit_on_id: hit_on.id, room_master_id: hit_on.hima_owner_id, user_ids: [hit_on.user_id, hit_on.hima_owner_id])
    else
      hit_on_and_errors[:errors] = hit_on.errors.full_messages
    end
    render json:{ hit_on_and_errors: hit_on_and_errors }
  end

  private

  def hit_on_params
    hima_owner_id = Hima.find(params[:hima_id]).user.id
    params.require(:hit_on).permit(:line).merge(hima_id: params[:hima_id], user_id: current_user.id, hima_owner_id: hima_owner_id)
  end
end
