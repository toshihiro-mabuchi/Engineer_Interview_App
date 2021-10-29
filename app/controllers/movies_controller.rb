class MoviesController < ApplicationController

  # GET /resource/index
  def index
    @movies = Movie.where(pattern_id: params[:id]).order(:order_number)
    @movie_size = Movie.where(pattern_id: params[:id]).size
    @pattern = Pattern.find(params[:id])
    @pattern_size = Pattern.all.size
  end

  # GET /resource/index
  def show
    # @movies = Movie.where(pattern_id: params[:id]).order(:order_number)
    # @movie_size = Movie.where(pattern_id: params[:id]).size
    # @pattern = Pattern.find(params[:id])
    # @pattern_size = Pattern.all.size
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
    @pattern_size = Pattern.all.size
    # respond_to do |format|
    #   format.html {}
    #   format.js {}
    # end
    # results = { :message => post_text }
    # render partial: 'ajax_partial', locals: { :results => results }
  end

end
