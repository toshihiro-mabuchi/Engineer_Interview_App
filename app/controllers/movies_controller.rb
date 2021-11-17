class MoviesController < ApplicationController

  # GET /resource/selected_patterns
  def selected_patterns
    @movies = Movie.where(pattern_id: params[:id]).order(:order_number)
    @movie_size = Movie.where(pattern_id: params[:id]).size
    @pattern = Pattern.find(params[:id])
    @pattern_size = Pattern.all.size
  end

  # GET /resource/index
  def index
    @movies = Movie.all.order(:pattern_id, :order_number).group_by(&:pattern_id)
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
    @movie = Movie.new
  end

  # POST /resource
  def create
    @patterns = Pattern.all.order(:id)
    @pattern = Pattern.find(3)
    @movie = @pattern.movies.new(movie_params)
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
        comment: params[:movie][:comment]
      })
      # end
      # if @movie.save
      if movie.save
      #   debugger
        respond_to do |format|
          format.js { flash.now[:success] = "動画を追加しました。" }
          # flash.now[:success] = "動画を追加しました。"
          # redirect_to root_path
        end
      end
    else
      debugger
      respond_to do |format|
        format.js { flash.now[:danger] = "URLが正しくありません。" }
        # flash.now[:danger] = "URLが正しくありません。"
        # redirect_to root_path
      end
    end
  end

  # GET /resource/edit
  def edit
  end

  # PUT /resource
  def update
    @movies = Movie.all
    @movie = Movie.find(params[:id])
    youtube_url = params[:movie][:youtube_url]
    youtube_mid = youtube_url.last(11)
    url = "https://www.youtube.com/oembed?url=http://www.youtube.com/watch?v=#{youtube_mid}&format=json"
    url = URI.encode url
    uri = URI.parse url
    require "net/http"
    json = Net::HTTP.get(uri)
    if valid_json?(json)
      if movie_json = JSON.parse(json)
        @movie.update_attributes ({
          title: movie_json["title"],
          thumbnail_url: movie_json["thumbnail_url"],
          youtube_mid: youtube_mid,
          youtube_url: "https://youtu.be/#{youtube_mid}",
          author_name: movie_json["author_name"],
          category: params[:movie][:category],
          text: params[:movie][:text],
          display: params[:movie][:display]
        })
      end
      respond_to do |format|
        format.js { flash.now[:success] = "動画を更新しました。" }
      end
    else
      respond_to do |format|
        format.js { flash.now[:danger] = "URLが正しくありません。" }
      end
    end
  end

  # DELETE /resource
  def destroy
  end

  def next_movies
    @movies = Movie.where(pattern_id: params[:id]).order(:order_number)
    @movie_size = Movie.where(pattern_id: params[:id]).size
    @pattern = Pattern.find(params[:id])
    @pattern_size = Pattern.all.size
  end

  private

    def movie_params
      params.require(:movie).permit(:title, :comment, :youtube_url)
    end

    def valid_json?(json)
      JSON.parse(json)
      return true
    rescue JSON::ParserError => e
      return false
    end

end
