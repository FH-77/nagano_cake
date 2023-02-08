class Admin::GenresController < ApplicationController
  def index
    @genres = Genre.new
    @genre = Genre.all
  end

  def edit
    @genres = Genre.find(params[:id])
  end

  def create
    @genres = Genre.create(genre_params)
    @genres.save
    redirect_to admin_genres_path
  end

  def update
    @genres = Genre.find(params[:id])
    @genres.update(genre_params)
    redirect_to admin_genres_path
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end

end
