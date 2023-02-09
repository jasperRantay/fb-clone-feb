class CommentsController < ApplicationController



    # The second one works
    # def create

    #     @post = Post.find(params[:post_id])
    #     @comment = @post.comments.create(comment_params)
    #     redirect_to fbpages_path(@post)

    # end

    # private
    # def comment_params
    #   params.require(:comment).permit(:commenter, :body)
    # end


    def create 
        @post = Post.find(params[:post_id])
        @comment = @post.comments.new(comment_params)
        if @comment.save
            redirect_to fbpages_path(@post),
            notice: "Comment Added"
        else
            redirect_to fbpages_path(@post)
        end
    end

     private
    def comment_params
      params.require(:comment).permit(:body, :post_id)
    end

end
