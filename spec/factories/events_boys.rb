# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :events_boy do
    boys_400_m_im false
    boys_1600_m false
    boys_400_m false
    boys_110_m_hh false
    boys_800_m false
    boys_3200_m false
    boys_200_m false
    time_400_m_im 1.5
    time_1600_m 1.5
    time_400_m 1.5
    time_110_m_hh 1.5
    time_800_m 1.5
    time_3200_m 1.5
    time_200_m 1.5
    place_400_m_im 1
    place_1600_m 1
    place_400_m 1
    place_110_m_hh 1
    place_800_m 1
    place_3200_m 1
    place_200_m 1
    athlete_id 1
    meet_id 1
  end
end
