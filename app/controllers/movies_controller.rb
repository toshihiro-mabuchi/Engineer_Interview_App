class MoviesController < ApplicationController
  # addアクションのみCSRFの対策を除外する。
  protect_from_forgery except: [:add]
  before_action :logged_in_user, only: %i(selected_movies add)

  # GET /resource/selected_patterns
  def selected_patterns
    @movies = Movie.where(pattern_id: params[:id]).order(:order_number)
    @movie_size = Movie.where(pattern_id: params[:id]).size
    @pattern = Pattern.find(params[:id])
    @pattern_size = Pattern.all.size
  end

  # GET /resource/index
  def index
    @movies = Movie.all.order(:pattern_id, :order_number, :id).group_by(&:pattern_id)
  end

  # GET /resource/show
  def show

  end

  # GET /resource/new
  def new
    @movie = Movie.new
  end

  # POST /resource/create
  def create
    # @patterns = Pattern.all.order(:id)
    # @pattern = Pattern.find(3)
    movie = Movie.new(movie_params)
    youtube_url = params[:movie][:youtube_url]
    youtube_mid = youtube_url.last(11)
    url = "https://www.youtube.com/oembed?url=http://www.youtube.com/watch?v=#{youtube_mid}&format=json"
    # url = URI.encode url
    uri = URI.parse url
    require "net/http"
    json = Net::HTTP.get(uri)
    if valid_json?(json)
      movie_json = JSON.parse(json)
      movie = Movie.new({
        title: movie_json["title"],
        thumbnail_url: movie_json["thumbnail_url"],
        youtube_mid: youtube_mid,
        youtube_url: "https://youtu.be/#{youtube_mid}",
        author_name: movie_json["author_name"],
        text: params[:movie][:text]
      })
      if movie.save
        flash.now[:success] = "動画を追加しました。"
        redirect_to movies_path
      end
    else
      flash.now[:danger] = "URLが正しくありません。"
      redirect_to movies_path
    end
  end

  # GET /resource/edit
  def edit
    @movie = Movie.find(params[:id]) 
  end

  # PUT /resource
  def update
    @movies = Movie.all
    @movie = Movie.find(params[:id])
    youtube_url = params[:movie][:youtube_url]
    youtube_mid = youtube_url.last(11)
    url = "https://www.youtube.com/oembed?url=http://www.youtube.com/watch?v=#{youtube_mid}&format=json"
    # url = URI.encode url
    uri = URI.parse url
    require "net/http"
    json = Net::HTTP.get(uri)
    if valid_json?(json)
      if movie_json = JSON.parse(json)
        @movie.update ({
          title: movie_json["title"],
          thumbnail_url: movie_json["thumbnail_url"],
          youtube_mid: youtube_mid,
          youtube_url: "https://youtu.be/#{youtube_mid}",
          author_name: movie_json["author_name"],
          text: params[:movie][:text]
        })
      end
      flash[:success] = "動画を更新しました。"
      redirect_to movies_path
    else
      flash[:danger] = "URLが正しくありません。"
      redirect_to movies_path
    end
  end

  # DELETE /resource
  def destroy
    @movie = Movie.find(params[:id])
    if @movie.destroy
      flash[:success] = "動画『#{@movie.title}』を削除しました。"
      redirect_to movies_path
    end
  end

  def next_movies
    @movies = Movie.where(pattern_id: params[:id]).order(:order_number)
    @movie_size = Movie.where(pattern_id: params[:id]).size
    @pattern = Pattern.find(params[:id])
    @pattern_size = Pattern.all.size
  end

  def selected_movies
    @movies = Movie.where(selected: false).order(:id)
    # @selected_movies = Selectedmovie.where(selected: true).order(:movie_id)
    @selected_movies = Movie.where(selected: true).order(:pattern_id, :order_number)
  end

  # def add
  #   movie = Movie.find(params[:id])
  #   movie.selected = true
  #   pattern_max = Movie.all.maximum(:pattern_id)
  #   if pattern_max == 0
  #     movie.pattern_id = 1
  #     movie.order_number = 1
  #   else
  #     order_number_max = Movie.where(pattern_id: pattern_max).maximum(:order_number)
  #     if order_number_max == 4
  #       movie.pattern_id = pattern_max + 1
  #       movie.order_number = 1
  #     else
  #       movie.pattern_id = pattern_max
  #       movie.order_number = order_number_max + 1
  #     end
  #   end
  #   if movie.save
  #     hash = {id: movie.id, name: movie.title, pattern_id: movie.pattern_id, order_number: movie.order_number}
  #     require 'json'
  #     render :json => hash.to_json
  #   else
  #     head 500
  #   end
  # end


  private

    def movie_params
      params.require(:movie).permit(:youtube_url, :text)
    end

    def valid_json?(json)
      JSON.parse(json)
      return true
    rescue JSON::ParserError => e
      return false
    end

end
