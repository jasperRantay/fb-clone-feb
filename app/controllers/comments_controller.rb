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
            redirect_to fbpages_path,
            notice: "Comment Added"
        else
            redirect_to fbpages_path
        end
    end

    def destroy
        @post = Post.find(params[:post_id])
        @comment = @post.comments.find(params[:id])
        @comment.destroy
        redirect_to fbpages_path, status: :see_other,
        alert: "Comment Deleted"
    end

     private
    def comment_params
      params.require(:comment).permit(:body, :post_id, :name)
    end

end
