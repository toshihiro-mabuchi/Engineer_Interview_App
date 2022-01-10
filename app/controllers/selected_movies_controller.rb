class SelectedMoviesController < ApplicationController
  before_action :logged_in_user, only: %i(selected_movies add)


  # GET /resource/index
  def index
    @movies = Movie.where(selected: false).order(:id)
    @selected_movies = Movie.where(selected: true).order(:pattern_id, :order_number)
  end

  # GET /resource/edit
  def edit
    @movie = Movie.find(params[:id]) 
  end

  # POST /resource/create
  def create
    movie = Movie.find(params[:id])
    movie.pattern_id = 0
    movie.order_number = 0
    movie.selected = false
    if movie.save
      flash[:success] = "動画『#{movie.title}』を一覧に戻しました。"
      redirect_to selected_movies_path
    else
      flash[:danger] = "動画『#{movie.title}』を一覧に戻せませんでした。"
      redirect_to selected_movies_path
    end
  end

  # DELETE /resource/destroy
  def destroy
    movie = Movie.find(params[:id])
    movie.pattern_id = 0
    movie.order_number = 0
    movie.selected = false
    if movie.save
      flash[:success] = "動画『#{movie.title}』を一覧に戻しました。"
      redirect_to selected_movies_path
    else
      flash[:danger] = "動画『#{movie.title}』を一覧に戻せませんでした。"
      redirect_to selected_movies_path
    end
  end

  def add
    movie = Movie.find(params[:id])
    movie.selected = true
    pattern_max = Movie.all.maximum(:pattern_id)
    if pattern_max == 0
      movie.pattern_id = 1
      movie.order_number = 1
    else
      order_number_max = Movie.where(pattern_id: pattern_max).maximum(:order_number)
      if order_number_max == 4
        movie.pattern_id = pattern_max + 1
        movie.order_number = 1
      else
        movie.pattern_id = pattern_max
        movie.order_number = order_number_max + 1
      end
    end
    if movie.save
      hash = {id: movie.id, name: movie.title, pattern_id: movie.pattern_id, order_number: movie.order_number}
      require 'json'
      render :json => hash.to_json
    else
      head 500
    end
  end

end
