class Api::V1::BlogsController < ApplicationController
  before_action :blog_params, only: [:create, :update]

  def index 
    blogs = Blog.all
    render json: blogs, each_serializer: BlogSerializer
  end

  def show
    blog = Blog.find(params[:id])
    # シリアライザーで調整する
    render json: blog, Serializer: BlogSerializer
  end

  def create
    blog = Blog.new(blog_params)
    if blog.save
      render json: {message: "登録完了しました"}
    else
      errors = blog.errors.full_messages.map {|message| {message: message}}
      render json: erros, status: :bad_request
    end
  end
  

  private

  def blog_params
    params.permit(
      :title,
      :contents
    )
  end
end
