class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = User.find(params[:id])
  end

  private

  def message_params
    params.require(:user).permit(:nickname, :how_old_id, :sex_id, :introduction, {images: []}).merge(user_id: current_user.id)
  end

end
