class UsersController < ApplicationController
    def show
        @user = User.find_by(id: params[:id])
        if @user.nil?
        render file: 'public/404.html', status: :not_found
        end
    end

    def create
    end  

    def form
    end

    def calendar
    end

    # def set_duration
    #     date = Date.strptime(params["date"], '%Y年%m月%d日')

    #     # TODO 1というのを後で修正する
    #     @user = User.get_info(params["duration"], date, 1)

    #     #グラフで必要になるデータをここで作成する
    #     # graph_data = User.get_graph_data(@user, :body_percentage)

    #     render json: @user.as_json(include: [:physicals, :target]).merge(
    #         graph_data: {},
    #     )
    # end

    def set_duration
        
        # 1. DBからデータを取得する
        
        # results = Physical.select("EXTRACT(month FROM date) AS month, AVG(muscle_mass) AS average_muscle_mass")
        #                   .where("date >= ?", 5.months.ago.beginning_of_month)
        #                   .group("EXTRACT(month FROM date)")  # 注意: GROUP BY に対する項目を修正
        #                   .order("month DESC")  # 注意: ORDER BY に対する項目を修正
        #                   .limit(5)
        # date = Date.today
        # Physical.where(date: date)
        #         .or(Physical.where(date: date - 1.month))
        #         .or(Physical.where(date: date - 2.month))
        #         .or(Physical.where(date: date - 3.month))
        
        
        #todo 31日の場合などを考える　#4ヶ月のセレクトフィールドの場合
        date = Date.today
        date=Date.new(2023, 10, 25)
        dates_array = [date, date - 1.month, date - 2.month, date - 3.month]
        weight_array = Physical.where(date: dates_array).pluck(:weight)

        
        
        # 2. 取得したデータを整形する
        # labels: ["5月", "4月", "3月", "2月", "1月"] のような形で直近の月をラベルとして取得します。
        labels = dates_array.map { |result| "#{result.month.to_i}月" }
    
        # data: 各月の平均muscle_massを配列として取得します。例: [12.5, 12.8, 13.5, 14.2, 14.7]
        # data = results.map(&:muscle_mass)
        
        # 3. JSONデータを生成してレンダリングする
        render json: {
            labels: labels,
            datasets: [{
                label: dates_array,
                data: weight_array,
                backgroundColor: 'rgba(75, 192, 192, 0.2)',
                borderColor: 'rgba(75, 192, 192, 1)',
                borderWidth: 2,
                fill: false
            },
            {
                label: '目標',
                data: [14.0, 13.0, 12.0, 11.0, 10.0],  # これはあくまで例で、具体的な目標値は要設定
                backgroundColor: 'rgba(255, 99, 132, 0.2)',
                borderColor: 'rgba(255, 99, 132, 1)',
                borderWidth: 2,
                fill: false
            }]
        }
    end
    

    def get_date
    end

end
