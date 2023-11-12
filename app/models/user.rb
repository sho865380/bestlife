class User < ApplicationRecord
    has_many :physicals
    has_one :target
    validates :name, presence: true, length: { maximum: 50 }

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX, message: "＠を挿入してください" }

    validates :password, presence: true



    def self.get_info(duration, end_date, user_id)
        start_date = get_start_date(duration, end_date)

        includes(:physicals, :target)
          .where(id: user_id)
          .where(physicals: { date: start_date..end_date })
          .first
    end

    private

    def self.get_start_date(duration, end_date)
        case duration
        when "3_weeks"
            start_date = end_date - 3.week
        when "2_weeks"
            start_date = end_date - 2.week
        when "1_weeks"
            start_date = end_date - 1.week
        end

        start_date
    end
end
