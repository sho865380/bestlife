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


    def set_duration
        # この部分を追加
        
        selected_duration = params[:duration]
        
        
        #todo 31日の場合などを考える　#4ヶ月のセレクトフィールドの場合
        date = Date.today
      
      
        dates_array = generate_dates_array(date, selected_duration)
        # dates_array = [date, date - 1.month, date - 2.month, date - 3.month]
        muscle_mass_array = Physical.where(date: dates_array).pluck(:muscle_mass)
        
        
        
        # 2. 取得したデータを整形する
        # labels: ["5月", "4月", "3月", "2月", "1月"] のような形で直近の月をラベルとして取得します。
        # labels = dates_array.reverse.map { |result| "#{result.month.to_i}月" }
        
        #generate_dates_arrayを使って場合分け
        labels = dates_array.reverse.map { |d| "#{d.month.to_i}月#{d.day.to_i}日" }
        
        
        
        # 3. JSONデータを生成してレンダリングする
        render json: {
            labels: labels,
            datasets: [
                {
                label: '現状',
                data: muscle_mass_array,
                backgroundColor: 'rgba(75, 192, 192, 0.2)',
                borderColor: 'rgba(75, 192, 192, 1)',
                borderWidth: 2,
                fill: false
            },
            {
                label: '目標',
                data: [62.0, 64.0, 66.6, 67.0, 68.0],  # これはあくまで例で、具体的な目標値は要設定
                backgroundColor: 'rgba(255, 99, 132, 0.2)',
                borderColor: 'rgba(255, 99, 132, 1)',
                borderWidth: 2,
                fill: false
            }]
        }
    end

    def set_duration2
      # この部分を追加
      
      selected_duration = params[:duration]
      
      
      #todo 31日の場合などを考える　#4ヶ月のセレクトフィールドの場合
      date = Date.today
      
      
      dates_array = generate_dates_array(date, selected_duration)
      # dates_array = [date, date - 1.month, date - 2.month, date - 3.month]
      body_percentage_array = Physical.where(date: dates_array).pluck(:body_percentage)

      
      
      # 2. 取得したデータを整形する
      # labels: ["5月", "4月", "3月", "2月", "1月"] のような形で直近の月をラベルとして取得します。
      # labels = dates_array.reverse.map { |result| "#{result.month.to_i}月" }
      labels = dates_array.reverse.map { |d| "#{d.month.to_i}月#{d.day.to_i}日" }
  
      
      
      # 3. JSONデータを生成してレンダリングする
      render json: {
          labels: labels,
          datasets: [
              {
              label: '現状',
              data: body_percentage_array,
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

  def set_duration3
    # この部分を追加
    
    selected_duration = params[:duration]
    
    
    #todo 31日の場合などを考える　#4ヶ月のセレクトフィールドの場合
    date = Date.today
    
  
    dates_array = generate_dates_array(date, selected_duration)
    # dates_array = [date, date - 1.month, date - 2.month, date - 3.month]
    weight_array = Physical.where(date: dates_array).pluck(:weight)
    
    
    
    # 2. 取得したデータを整形する
    # labels: ["5月", "4月", "3月", "2月", "1月"] のような形で直近の月をラベルとして取得します。
    # labels = dates_array.reverse.map { |result| "#{result.month.to_i}月" }
    
    #generate_dates_arrayを使って場合分け
    labels = dates_array.reverse.map { |d| "#{d.month.to_i}月#{d.day.to_i}日" }
    
    
    
    # 3. JSONデータを生成してレンダリングする
    render json: {
        labels: labels,
        datasets: [
            {
            label: '現状',
            data: weight_array,
            backgroundColor: 'rgba(75, 192, 192, 0.2)',
            borderColor: 'rgba(75, 192, 192, 1)',
            borderWidth: 2,
            fill: false
        },
        {
            label: '目標',
            data: [62.0, 64.0, 66.6, 67.0, 68.0],  # これはあくまで例で、具体的な目標値は要設定
            backgroundColor: 'rgba(255, 99, 132, 0.2)',
            borderColor: 'rgba(255, 99, 132, 1)',
            borderWidth: 2,
            fill: false
        }]
    }
end
    

    private

    # 期間を受け取り、その期間に応じた日付の配列を生成するメソッド
    def generate_dates_array(base_date, duration)
      base_date = Date.today
      case duration
      when '1_week'
        (0..6).map { |n| base_date - n.days }
      when '2_weeks'
        (0..13).step(7).map { |n| base_date - n.days }
      when '3_weeks'
        (0..20).step(7).map { |n| base_date - n.days }
      when '1_month'
        (0..3).map { |n| base_date - n.weeks }
      when '2_months'
        (0..1).map { |n| base_date - n.months }
      when '3_months'
        (0..2).map { |n| base_date - n.months }
      when '4_months'
        (0..3).map { |n| base_date - n.months }
      else
        [] # 不正な値の場合は空の配列を返す
      end
    end
  end   


