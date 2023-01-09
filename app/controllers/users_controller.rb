class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :user_owner?, only: [:edit, :update]
  def show
    set_user
  end

  def edit
    set_user
  end

  def update
    set_user
    if @user.update(profile_params)
      redirect_to user_path(current_user)
    else
      render :new
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
