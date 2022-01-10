class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # Cross Site Request Forgeriesの頭文字をとってCSRF（シーサーフと読む）
  # protect_from_forgeryは、Railsアプリ内からの(GET以外の)リクエストにはセキュリティトークンを仕込み、
  # それを確認することでアプリ内からの有効なリクエストかどうかを判断する。
  # withオプション・・・セキュリティトークンが一致しなかった場合の挙動を指定するオプション
  # :execption（例外を起こす）・・・トークンが一致しないとActionController::InvalidAuthenticityTokenエラーを起こす。

  def check_admin
    email = resource&.email || params[:user][:email].downcase
    if email == 'admin@email.com'
      flash[:notice] = "管理者の変更・削除はできません。" 
      redirect_to edit_user_registration_path
    end
  end

  # ログイン済みのユーザーか確認する。
	def logged_in_user
		unless user_signed_in?
			flash[:danger] = "管理者でログインして下さい。"
			redirect_to root_url
		end
	end

  private

  # ログイン後のリダイレクト先
  def after_sign_in_path_for(resource)
    if current_user
      flash[:notice] = "ログインに成功しました." 
      root_path
    else
      flash[:danger] = "ログインに失敗しました。ログインをやり直して下さい。" 
      new_user_session_path
    end
  end

  # ログアウト後のリダイレクト先
  def after_sign_out_path_for(resource_or_scope)
    flash[:notice] = "ログアウトしました。"
    root_path
  end
  
end
