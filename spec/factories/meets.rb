# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :meet do
    date "2014-02-21"
    name "MyString"
    location "MyString"
    season_id 1
  end
end
