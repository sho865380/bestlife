# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# db/seeds.rb

# ユーザーデータの作成
user = User.create!(
  name: "テストユーザー",
  email: "test@example.com",
  password: "password123"
)

# physicalsテーブルにデータを追加
5.times do |i|
  Physical.create!(
    date: Date.today - i.days,
    weight: 60 + rand(5..15),
    body_percentage: rand(10.0..20.0).round(2),
    muscle_mass: rand(20.0..30.0).round(2),
    user_id: user.id
  )
end

# targetsテーブルにデータを追加
Target.create!(
  date: Date.today,
  datetime: DateTime.now,  # "datetime"カラムはt.dateのタイプなので、適切なデータタイプに修正する必要があります。t.datetimeに変更することをお勧めします。
  target_weight: 65,
  target_body_percentage: 15.0,
  target_muscle_mass: 25.0,
  user_id: user.id
)
