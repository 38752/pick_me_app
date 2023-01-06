class HimasController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    @himas = Hima.all.includes(:hima_purposes, :user).order("created_at DESC")
  end

  def new
    @purposes = Purpose.all
    @hima_form = HimaForm.new
  end

  def create
    @purposes = Purpose.all
    @hima_form = HimaForm.new(hima_form_params)
    if @hima_form.valid?
      @hima_form.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

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

end
