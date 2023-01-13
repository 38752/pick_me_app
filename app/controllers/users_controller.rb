class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :user_owner?, only: [:edit, :update]
  before_action :set_user
  def show
    @memo = Memo.find_by(subject_id: current_user.id, object_id: params[:id].to_i)
    @hit_on = HitOn.new
  end

  def edit
  end

  def update
    if @user.update(profile_params)
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  private

  def user_owner?
    redirect_to root_path if params[:id].to_i != current_user.id
  end

  def set_user
    @user = User.find(params[:id])
  end

  def profile_params
    params.require(:user).permit(:nickname, :how_old_id, :sex_id, :introduction, {images: []})
  end

end
