class UsersController < ApplicationController
    before_action :authenticate_user!

    def index
        
    end

    def show
        @posts = Post.all
        @user = User.find(params[:id])
    end
end
