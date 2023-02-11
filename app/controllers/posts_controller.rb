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
        @post = Post.new(post_params)
        @post.user_id = current_user.id
        if @post.save
            redirect_to fbpages_path, notice: "Post Added"
        else
            render new
        end
    end

    def edit
        @post = Post.find(params[:id])
    end

    def update
        @post = Post.find(params[:id])
        @user = current_user.id
        if @post.update(post_params)
            redirect_to fbpages_path, notice: "Successfully Updated"
          else
            render :edit, status: :unprocessable_entity
          end
    end


    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        # @user = current_user.id
        redirect_to fbpages_path, status: :see_other, notice: "Post Deleted"
      end

    private
    def post_params
        params.require(:post).permit(:title, :body, :user_id)
    end




end
