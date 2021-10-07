
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

# 面談動画サンプルデーター作成
Movie.create!(
  order_number: 1,
  title: "賛美歌３１２番（いつくしみ深き）",
  thumbnail_url: "https://i.ytimg.com/vi/Bo-Cmd3JM4c/hqdefault.jpg",
  youtube_mid: "Bo-Cmd3JM4c",
  youtube_url: "https://youtu.be/Bo-Cmd3JM4c",
  author_name: "backbone777",
  pattern_id: 1,
  display_flag: true)

Movie.create!(
  order_number: 2,
  title: "【讃美歌320番】主よ御許に近づかん Nearer,My God,to Thee",
  thumbnail_url: "https://i.ytimg.com/vi/VHLVDYQ9n5g/hqdefault.jpg",
  youtube_mid: "VHLVDYQ9n5g",
  youtube_url: "https://youtu.be/VHLVDYQ9n5g",
  author_name: "S K",
  pattern_id: 1,
  display_flag: true)

Movie.create!(
  order_number: 3,
  title: "讃美歌461番「主われを愛す」",
  thumbnail_url: "https://i.ytimg.com/vi/xJ0cJ5DQeIs/hqdefault.jpg",
  youtube_mid: "xJ0cJ5DQeIs",
  youtube_url: "https://youtu.be/xJ0cJ5DQeIs",
  author_name: "meijigakuin",
  pattern_id: 1,
  display_flag: true)

Movie.create!(
  order_number: 4,
  title: "主の愛に生かされて",
  thumbnail_url: "https://i.ytimg.com/vi/zI2GcNhvovg/hqdefault.jpg",
  youtube_mid: "zI2GcNhvovg",
  youtube_url: "https://youtu.be/zI2GcNhvovg",
  author_name: "mickey71066",
  pattern_id: 1,
  display_flag: true)

end