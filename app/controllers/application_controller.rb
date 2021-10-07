class ApplicationController < ActionController::Base

  def check_admin
    email = resource&.email || params[:user][:email].downcase
    if email == 'admin@email.com'
      flash[:notice] = "管理者の変更・削除はできません。" 
      redirect_to edit_user_registration_path
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
