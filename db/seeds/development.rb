Member.create(
  provider: 'google',
  uid: '1000067891',
  email: 'user1@example.com',
  given_name: '太郎',
  given_name_kana: 'たろう',
  given_name_alphabet: 'Taro',
  family_name: '山田',
  family_name_kana: 'やまだ',
  family_name_alphabet: 'Yamada',
  image_url: Settings.member.no_image_url,
  slack_identifier: 'user1',
  group_id: Group.find_by(name: 'sales').id,
  title: 'ダイレクトセールス',
  title_alphabet: 'Direct Sales'
)
Member.create(
  provider: 'google',
  uid: '1000067892',
  email: 'user2@example.com',
  given_name: '花子',
  given_name_kana: 'はなこ',
  given_name_alphabet: 'Hanako',
  family_name: '鈴木',
  family_name_kana: 'すずき',
  family_name_alphabet: 'Suzuki',
  image_url: Settings.member.no_image_url,
  slack_identifier: 'user2',
  group_id: Group.find_by(name: 'human-resource').id,
)
Member.create(
  provider: 'google',
  uid: '1000067893',
  email: 'user3@example.com',
)
