class FavoritesController < ApplicationController
  before_action :set_favorite, only: %i[ show edit update destroy ]

  def index
      @favorites = current_user.favorites
    end
    def create
      @blog = Blog.find(params[:blog_id])
      favorite = current_user.favorites.build(blog_id: params[:blog_id])
      favorite.save
    end
    def destroy
      @blog = Blog.find(params[:blog_id])
      favorite = Favorite.find_by(blog_id: params[:blog_id], user_id: current_user.id)
      favorite.destroy
      if request.referer&.include?('/blogs')
        respond_to do |format|
          format.js { @current_page = "index" }
        end
      end
    end
  end
