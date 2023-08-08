class LikesController < ApplicationController
  def create
    @like = current_user.likes.new(like_params)

    unless @like.save 
      flash[:alert] = "Post is already liked"
    end

    redirect_to root_path
  end

  def destroy
    @like = current_user.likes.find(params[:id])

    @like.destroy
    redirect_to root_path
  end

  def like_params
    params.require(:like).permit(:post_id)
  end
end
