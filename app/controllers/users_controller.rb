class UsersController < ApplicationController
    def show
        @user = User.find(params[:id])
      end

    def form
      end
    def calendar
    end
    
end
