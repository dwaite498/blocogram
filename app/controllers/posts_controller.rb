class PostsController < ApplicationController
    before_action :owned_post, only: [:edit, :update, :destroy]
    before_action :set_post, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!
    
    def index
        @posts = Post.all
    end
    
    def new
        @post = current_user.posts.build
    end
    
    def create
        @post = current_user.posts.build(post_params)
        
        if @post.save
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
    
    def owned_post
       unless current_user == @post.user
        flash[:alert] = "This post does not belong to you!"
        redirect_to root_path
       end
    end
end
