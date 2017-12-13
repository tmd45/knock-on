# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

## Group: チーム名
FactoryBot.create(:group_exective)
FactoryBot.create(:group_ads)
FactoryBot.create(:group_creative)
FactoryBot.create(:group_customer_success)
FactoryBot.create(:group_director)
FactoryBot.create(:group_engineer)
FactoryBot.create(:group_general_affairs)
FactoryBot.create(:group_human_resource)
FactoryBot.create(:group_marketing)
FactoryBot.create(:group_sales)

# for Environment
load(Rails.root.join( 'db', 'seeds', "#{Rails.env.downcase}.rb"))
