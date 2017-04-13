class PostsController < ApplicationController
    before_action :set_post, only: [:show, :edit, :update, :destroy]
    
    def index
        @posts = Post.all
    end
    
    def new
        @post = Post.new
    end
    
    def create
        if @post = Post.create(post_params)
            flash[:success] = "Your post has been created!"
            redirect_to posts_path
        else
            flash[:alert] = "Your post was unable to be created, please check that you are using a valid image file." 
            render :new
        end
    end
    
    def show
    end
    
    def edit
    end
    
    def update
        if @post.update(post_params)
            flash[:success] = "Your post was updated successfully"
            redirect_to posts_path
        else
           flash[:alert] = "Your post was not updated, please try again."
           render :edit
        end
    end
    
    def destroy
        if @post.destroy
            flash[:success] = "Your post has been deleted"
            redirect_to posts_path
        else
           flash[:alert] = "Error, post has not been deleted. Please try again"
           render :edit
        end
    end
    
    private
    
    def post_params
       params.require(:post).permit(:image, :caption) 
    end
    
    def set_post
        @post = Post.find(params[:id])
    end
end
