class BlogsController < ApplicationController
    def new
        if params[:back]
            @blog = Blog.new(blog_params)
          else
            @blog = Blog.new
          end
    end

    def create
        if params[:back]
            render :new
        else
            Blog.create(blog_image: params[:blog][:blog_image], content: params[:blog][:content])
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
        @blog = Blog.find(blog_params) 
    end

    def confirm
        @blog = current_user.blogs.build(blog_params)
        render :new if @blog.invalid?
    end

    private
    def blog_params
      params.require(:blog).permit(:blog_image, :content, :image_cache, :user_id)
    end
end
