
# 管理者データー作成
User.create!(
  email: "admin@email.com",
  password: "password",
  password_confirmation: "password"
)

# 面談パターンサンプルデータ作成
4.times do |i|
  n = i + 1 
  Pattern.create!(
    name: "パターン#{n}"
)

end