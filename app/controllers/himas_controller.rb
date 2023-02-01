class HimasController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :hima_owner?, only: [:edit, :update]
  before_action :hima_editable?, only: [:edit, :update]
  def index
    @visible_open_range_ids = []
    OpenRange.all.each do |open_range|
      @visible_open_range_ids << open_range.id
    end
    for invisible_open_range_id in 90..99 do
      @visible_open_range_ids.delete(invisible_open_range_id)
    end

    @himas = Hima.where(open_range_id: @visible_open_range_ids).includes(:hima_purposes, :user, :hit_ons).order("created_at DESC")
    @hit_on = HitOn.new
  end

  def new
    @purposes = Purpose.all
    @hima_form = HimaForm.new

    @invisible_open_range_ids = []
    for invisible_open_range_id in 90..99 do
      @invisible_open_range_ids << invisible_open_range_id
    end
  end

  def create
    # paramsのopen_range_idは10しか受け付けない(随時更新)
    permitted_params_open_range_ids = [10]
    redirect_to root_path unless permitted_params_open_range_ids.include?(params[:hima_form][:open_range_id].to_i)

    @purposes = Purpose.all
    @hima_form = HimaForm.new(hima_form_params)

    if @hima_form.valid?
      @hima_form.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @purposes = Purpose.all
    @hima_form = HimaForm.new(hima_form_find(params[:id]))

    @invisible_open_range_ids = []
    for invisible_open_range_id in 90..99 do
      @invisible_open_range_ids << invisible_open_range_id
    end
    @invisible_open_range_ids.delete(99)
  end

  def update
    # paramsのopen_range_idは10と99しか受け付けない(随時更新)
    permitted_params_open_range_ids = [10, 99]
    redirect_to root_path unless permitted_params_open_range_ids.include?(params[:hima_form][:open_range_id].to_i)

    @purposes = Purpose.all
    @hima_form = HimaForm.new(hima_form_params.merge(hima_id: params[:id].to_i))
    if @hima_form.valid?
      @hima_form.update
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def hima_owner?
    redirect_to root_path if Hima.find(params[:id]).user != current_user
  end

  def hima_editable?
    # open_range_idの元データが10の時しか受け付けない(随時更新)
    permitted_hima_open_range_ids = [10]
    redirect_to root_path unless permitted_hima_open_range_ids.include?(Hima.find(params[:id]).open_range_id)
  end

  def hima_form_params
    purposes_list = []
    Purpose.all.each do |purpose|
      purposes_list << "purpose_#{purpose.id}"
    end
    purposes_hash = {}
    Purpose.all.each do |purpose|
      purposes_hash[:"purpose_#{purpose.id}"] = params.require(:hima_form)[:"purpose_#{purpose.id}"]
    end
    params.require(:hima_form).permit(
      :title, :location, :text, :open_range_id, purposes_list
    ).merge(user_id: current_user.id, purposes: purposes_hash)
  end

  def hima_form_find(id)
    hima = Hima.find(id)
    return_hash = {}

    return_hash[:title] = hima.title
    return_hash[:location] = hima.location
    return_hash[:text] = hima.text
    return_hash[:open_range_id] = hima.open_range_id
    hima.hima_purposes.where(purpose_id: Purpose.ids).each do |hima_purpose|
      return_hash[:"purpose_#{hima_purpose.purpose_id}"] = hima_purpose.flag
    end
    return return_hash
  end
end
