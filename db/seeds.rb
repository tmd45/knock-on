# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

## Group: チーム名
FactoryGirl.create(:group_exective)
FactoryGirl.create(:group_ads)
FactoryGirl.create(:group_creative)
FactoryGirl.create(:group_customer_success)
FactoryGirl.create(:group_director)
FactoryGirl.create(:group_engineer)
FactoryGirl.create(:group_general_affairs)
FactoryGirl.create(:group_human_resource)
FactoryGirl.create(:group_marketing)
FactoryGirl.create(:group_sales)
