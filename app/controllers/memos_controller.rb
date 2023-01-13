class MemosController < ApplicationController
  before_action :user_owner?
  before_action :set_memo
  def edit
    if @memo == nil
      @memo = Memo.create(memo: "", subject_id: params[:id].to_i, object_id: params[:user_id].to_i)
    end
  end

  def update
    if @memo.update(memo_params)
      redirect_to user_path(@memo.object)
    end
  end

  private

  def user_owner?
    redirect_to root_path if params[:id].to_i != current_user.id
  end

  def set_memo
    @memo = Memo.find_by(subject_id: params[:id].to_i, object_id: params[:user_id].to_i)
  end

  def memo_params
    params.require(:memo).permit(:memo)
  end
end
