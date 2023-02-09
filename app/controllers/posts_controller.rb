class PostsController < ApplicationController

    before_action :authenticate_user!

    def index
        # @posts = Post.all
    end

    def new
        # @user = User.find[:id]
        @post = Post.new
    end

    def create
        @post = Post.new(event_params)
        @post.user_id = current_user.id
        if @post.save
            redirect_to fbpages_path, notice: "Post Added"
        else
            render new
        end
    end

    private
    def event_params
        params.require(:post).permit(:title, :body, :user_id)
    end


end
