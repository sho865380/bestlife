class PhysicalsController < ApplicationController
  
  
  
  def create
    @physical = Physical.new(physical_params)
    if @physical.save
      redirect_to some_path, notice: 'データが正常に保存されました。'
    else
      render "users/show"
    end
  end
  
  private
  
  def physical_params
    params.require(:physical).permit(:date, :weight, :body_percentage, :muscle_mass)
  end
end