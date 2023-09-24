class UsersController < ApplicationController
    def show
        @user = User.find(params[:id])
    end

    def create
    end  

    def form
    end

    def calendar
    end

    def set_duration
        date = Date.strptime(formatted_string, '%Y年%m月%d日')
        # TODO 1というのを後で修正する
        @user = User.get_info(params["duration"], 1)

        #グラフで必要になるデータをここで作成する
        graph_data1 = Physical.get_graph_data(@user.physicals, :body_percentage)
        graph_data2 = Physical.get_graph_data(@user.physicals, :weight)
        graph_data3 = Physical.get_graph_data(@user.physicals, :muscle_mass)

        render json: @user.as_json(include: [:physicals, :targets]).merge(
            graph_data1: graph_data1,
            graph_data2: graph_data2,
            graph_data3: graph_data3
        )
    end
end
