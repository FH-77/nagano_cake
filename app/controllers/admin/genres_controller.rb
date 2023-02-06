class Admin::GenresController < ApplicationController
  def index
    @genres = Genre.new
    @genre = Genre.all
  end

  def edit
  end

  def create
    @genres = Genre.create(genres_params)
    @genres.save
    redirect_to admin_genres_path
  end

  def update
  end

  private

  def genres_params
    params.require(:genre).permit(:name)
  end

end
