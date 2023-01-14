class HitOnsController < ApplicationController
  def create
    hit_on_and_errors = {hit_on: nil, errors: nil}
    hit_on = HitOn.new(hit_on_params)

    if hit_on.save
      hit_on_and_errors[:hit_on] = hit_on
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