
# 管理者データー作成
User.create!(
  email: "admin@email.com",
  password: "password",
  password_confirmation: "password"
)

puts '管理者データー作成'

# 面談パターンサンプルデーター作成
4.times do |i|
  n = i + 1 
  Pattern.create!(
    name: "パターン#{n}"
  )
end

puts '面談パターンサンプルデーター作成'

# 面談動画サンプルデーター作成
Movie.create!(
  title: "【WEB面接（スマホ/PC）】 ポイント（実例/練習用）",
  thumbnail_url: "https://i.ytimg.com/vi/MrUHouwR43o/hqdefault.jpg",
  youtube_mid: "MrUHouwR43o",
  youtube_url: "https://youtu.be/MrUHouwR43o",
  author_name: "就活レシピ",
  text: "サンプル動画１",
  # pattern_id: 1,
  # order_number: 1
)

Movie.create!(
  title: "【完全版】WEB面接の通過率が劇的に上がる25のチェックリスト【就活/就職/転職】",
  thumbnail_url: "https://i.ytimg.com/vi/RyODmVaoQZ0/hqdefault.jpg",
  youtube_mid: "RyODmVaoQZ0",
  youtube_url: "https://youtu.be/RyODmVaoQZ0",
  author_name: "ひろさんチャンネル【面接アドバイザー社長】",
  text: "サンプル動画２",
  # pattern_id: 1,
  # order_number: 2
)

Movie.create!(
  title: "【ガチで内定が取れる面接練習法】就活で明日から使える8つの面接テクニックで内定獲得！",
  thumbnail_url: "https://i.ytimg.com/vi/j8bDR_0bIoE/hqdefault.jpg",
  youtube_mid: "j8bDR_0bIoE",
  youtube_url: "https://youtu.be/j8bDR_0bIoEhttps://youtu.be/j8bDR_0bIoE",
  author_name: "ひろさんチャンネル【面接アドバイザー社長】",
  text: "サンプル動画３",
#   pattern_id: 1,
#   order_number: 3
)

Movie.create!(
  title: "【断言】転職の面接は、この流れで進みます。",
  thumbnail_url: "https://i.ytimg.com/vi/_4ejLOdJ_Ok/hqdefault.jpg",
  youtube_mid: "_4ejLOdJ_Ok",
  youtube_url: "https://youtu.be/_4ejLOdJ_Ok",
  author_name: "【転職】サラタメのホワイト転職",
  text: "サンプル動画４",
  # pattern_id: 1,
  # order_number: 4
)

Movie.create!(
  title: "この逆質問を使って、面接を無双しちゃってください",
  thumbnail_url: "https://i.ytimg.com/vi/S5RZmWHhFiQ/hqdefault.jpg",
  youtube_mid: "S5RZmWHhFiQ",
  youtube_url: "https://youtu.be/S5RZmWHhFiQ",
  author_name: "末永 雄大 / すべらない転職エージェント",
  text: "サンプル動画５",
  # pattern_id: 2,
  # order_number: 1
)

Movie.create!(
  title: "【面接対策】転職の面接で合否を分けるたった2つのポイントを転職エージェントが解説！",
  thumbnail_url: "https://i.ytimg.com/vi/hhEkZxRMIUc/hqdefault.jpg",
  youtube_mid: "hhEkZxRMIUc",
  youtube_url: "https://youtu.be/hhEkZxRMIUc",
  author_name: "末永 雄大 / すべらない転職エージェント",
  text: "サンプル動画６",
  # pattern_id: 2,
  # order_number: 2
)

Movie.create!(
  title: "【面接通過率80%】未経験WEBエンジニアが面接で気をつけた3つのこと",
  thumbnail_url: "https://i.ytimg.com/vi/mEOq2H2WX-c/hqdefault.jpg",
  youtube_mid: "mEOq2H2WX-c",
  youtube_url: "https://youtu.be/mEOq2H2WX-c",
  author_name: "かよちんchannel",
  text: "サンプル動画７",
  # pattern_id: 2,
  # order_number: 3
)

Movie.create!(
  title: "【90％の人が知らない】エンジニアの面接で答えられるようにしておくべき3つの質問",
  thumbnail_url: "https://i.ytimg.com/vi/Pn7rTqSCS5c/hqdefault.jpg",
  youtube_mid: "Pn7rTqSCS5c",
  youtube_url: "https://youtu.be/Pn7rTqSCS5c",
  author_name: "エンジニアチャンネル",
  text: "サンプル動画８",
  # pattern_id: 2,
  # order_number: 4
)

puts '面談動画サンプルデーター作成'
