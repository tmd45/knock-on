# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

## Group: チーム名
# order はメンバー一覧での表示順序に影響する
# お客さまの対応が多いチームほど表示上位にするため、小さい数字にする
Group.create(order: 9, name: 'executive', name_kana: '')  # 役員にチーム名は表示しない
Group.create(order: 1, name: 'sales', name_kana: 'セールスチーム')
Group.create(order: 4, name: 'ads', name_kana: '広告運用チーム')
Group.create(order: 6, name: 'director', name_kana: 'ディレクションチーム')
Group.create(order: 2, name: 'marketing', name_kana: 'マーケティングチーム')
Group.create(order: 3, name: 'human-resource', name_kana: '人事部')
Group.create(order: 3, name: 'general-affairs', name_kana: '総務部')
Group.create(order: 7, name: 'creative', name_kana: 'クリエイティブチーム')
Group.create(order: 8, name: 'engineer', name_kana: '技術チーム')
Group.create(order: 5, name: 'customer-success', name_kana: 'カスタマーサクセスチーム')
