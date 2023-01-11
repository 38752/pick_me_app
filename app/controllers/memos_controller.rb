class MemosController < ApplicationController
  def edit
    @memo = Memo.find_by(subject_id: params[:id].to_i, object_id: params[:user_id].to_i)
    if @memo == nil
      @memo = Memo.create(memo: "", subject_id: params[:id].to_i, object_id: params[:user_id].to_i)
    end
  end

  def update
    @memo = Memo.create(memo_params)
  end

  private

  def memo_params
    params.require(:memo).permit(:memo).merge(subject_id: params[:id], object_id: params[:user_id])
  end
end
