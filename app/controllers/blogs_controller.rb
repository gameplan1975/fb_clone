class BlogsController < ApplicationController
    def new
        @user = User.new
    end

    def create
        if params[:back]
            render :new
        else
            Blog.create(blog_image: params[:blog][:blog_image], content: params[:blog][:content])
            #redirect_to "/blogs/new"
            redirect_to new_blog_path
        end
    end

    def index
        @blogs = Blog.all 
    end

    def update
        @blog = Blog.find(params[:id])
        if @blog.update(blog_params)
            redirect_to blogs_path, notice: "ブログを編集したで"
         else
            render :edit
        end
    end

    def edit
        @blog = Blog.find(params[:id])
    end

    def destroy
        @blog = Blog.find(params[:id])
        @blog.destroy
        redirect_to blogs_path, notice:"ブログをほかしたで"
    end

    def show
        @blog = Blog.find(params[:id]) 
    end

    def confirm
        @blog = Blog.new(params[:id])
    end

    private
    def blog_params
      params.require(:blog).permit(:blog_image, :content)
    end
end
