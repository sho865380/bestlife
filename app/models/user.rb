class User < ApplicationRecord
    has_many :physicals
    has_many :targets
    validates :name, {presence: true}
    validates :email, {presence: true, uniqueness: true}

    scope :get_info, ->(date_str, user_id) {
        includes(:physicals, :targets)
        .where(id: user_id)
        .where(physicals: { date: date_str })
    }

    # def body_fat_percentage
    #    (ユーザーの)フィジカルの今日の.body_percentage - (ユーザーの)ターゲットの体脂肪率の今日の.target_body_percentage
    # end
end
