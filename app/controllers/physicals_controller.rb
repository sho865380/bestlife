class PhysicalsController < ApplicationController
  
  
  def create
    @physical = Physical.new(physical_params)
  
    # 手動でユーザーを設定
    @user = User.find(session[:user_id]) # または別の方法でユーザーを取得
  
    if @physical.save
      redirect_to user_path(@user), notice: 'データが正常に保存されました。'
    else
      render "users/form"
    end
  end
  
  private
  
  def physical_params
    params.require(:physical).permit(:date, :weight, :body_percentage, :muscle_mass)
  end
end