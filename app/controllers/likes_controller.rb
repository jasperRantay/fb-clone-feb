class LikesController < ApplicationController


    def create
        @post = Post.find(params[:post_id])
        @user = User.find(params[:user_id])
        @like = Like.new(like_params)
        if @like.save
            redirect_to fbpages_path
        else
        
        end
    end

    def destroy
        @user = User.find(params[:id])
        @post = Post.find_by(like_params)
        @like = @user.likes.find(params[:id])
        @like.destroy!
        @post.user.likes.destroy
        redirect_to fbpages_path, status: :see_other
    end


    private

    def like_params
        params.permit(:user_id, :post_id)
    end

end

