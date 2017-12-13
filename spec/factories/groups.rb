FactoryBot.define do
  factory :group do
    sequence(:name) { |i| "group#{i}" }
    sequence(:name_kana) { |i| "グループ #{i}" }
    order 0

    ### 固定データ
    # order はメンバー一覧での表示順序に影響する
    # お客さまの対応が多いチームほど表示上位にするため、小さい数字にする
    factory :group_sales do
      order 1
      name 'sales'
      name_kana 'セールスチーム'
    end

    factory :group_marketing do
      order 2
      name 'marketing'
      name_kana 'マーケティングチーム'
    end

    factory :group_human_resource do
      order 3
      name 'human-resource'
      name_kana '人事部'
    end

    factory :group_general_affairs do
      order 3
      name 'general-affairs'
      name_kana '総務部'
    end

    factory :group_ads do
      order 4
      name 'ads'
      name_kana '広告運用チーム'
    end

    factory :group_customer_success do
      order 5
      name 'customer-success'
      name_kana 'カスタマーサクセスチーム'
    end

    factory :group_director do
      order 6
      name 'director'
      name_kana 'ディレクションチーム'
    end

    factory :group_creative do
      order 7
      name 'creative'
      name_kana 'クリエイティブチーム'
    end

    factory :group_engineer do
      order 8
      name 'engineer'
      name_kana '技術チーム'
    end

    factory :group_exective do
      order 9
      name 'executive'
      name_kana ''  # 役員にチーム名は表示しない
    end
  end
end
