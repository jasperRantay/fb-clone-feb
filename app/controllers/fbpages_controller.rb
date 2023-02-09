class FbpagesController < ApplicationController
    before_action :authenticate_user!
    def index
       @posts = Post.all
       @comment = Comment.all
    end
end
