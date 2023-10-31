class SessionsController < ApplicationController
    def create
        # 入力内容と一致するユーザーを取得し、変数@userに代入してください
        @user = User.find_by(email: params[:email], password: params[:password])
        # @userが存在するかどうかを判定するif文を作成してください
         if @user 
         session[:user_id] = @user.id           
         flash[:notice] = "ログインしました"            
         redirect_to("/users/#{@user.id}")            
        else
        @error_message = "メールアドレスまたはパスワードが間違っています"
        # @emailと@passwordを定義してください
        @email = params[:email]            
        @password = params[:password]
        render("sessions/login")            
        end
    
    end
    def login
    end
end
