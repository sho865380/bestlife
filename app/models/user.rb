class User < ApplicationRecord
    has_many :physicals
    has_many :targets
    validates :name, {presence: true}
    validates :email, {presence: true, uniqueness: true}

    # def body_fat_percentage
    #    (ユーザーの)フィジカルの今日の.body_percentage - (ユーザーの)ターゲットの体脂肪率の今日の.target_body_percentage
    # end
end
