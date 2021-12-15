class FavoritesController < ApplicationController



  def index

      @favorites = current_user.favorites

    end

    def create

      favorite = current_user.favorites.create(blog_id: params[:blog_id])

      redirect_to blogs_path, notice: "#{favorite.blog.user.email}'s post has been added to favorites"

    end

    def destroy

      favorite = current_user.favorites.find_by(id: params[:id]).destroy

      redirect_to blogs_path, notice: "#{favorite.blog.user.email}'s post has been removed to favorites"

    end

    def index

      @favorites = current_user.favorites

    end

  end
