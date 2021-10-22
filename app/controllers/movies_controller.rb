class MoviesController < ApplicationController

  # GET /resource/index
  def index
    @movies = Movie.where(pattern_id: params[:id]).order(:order_number)
    @movie_size = Movie.where(pattern_id: params[:id]).size
    @pattern = Pattern.find(params[:id])
  end

  # GET /resource/index
  def show
    # @movies = Movie.where(pattern_id: params[:id]).order(:order_number)
    # @movie_size = Movie.where(pattern_id: params[:id]).size
    # @pattern = Pattern.find(params[:id])
  end

  # GET /resource/new
  def new
  end

  # POST /resource
  def create
  end

  # GET /resource/edit
  def edit
  end

  # PUT /resource
  def update
  end

  # DELETE /resource
  def destroy
  end

  def next_movies
    @movies = Movie.where(pattern_id: params[:id]).order(:order_number)
    @movie_size = Movie.where(pattern_id: params[:id]).size
    @pattern = Pattern.find(params[:id])
  end

end
