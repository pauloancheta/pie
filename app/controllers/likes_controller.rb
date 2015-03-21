class LikesController < ApplicationController
  def create
    @like = current_user.likes.build(dish_id: params[:dish_id])
    @like.save!
    render nothing: true
  end

  def destroy
    @like = Like.where(dish_id: params[:dish_id], user_id: current_user.id).first
    @like.destroy!
    render nothing: true
  end

  private
  def likes_params
    params.require(:like).permit(:dish_id, :user_id)
  end
end