FactoryGirl.define do
  factory :event do
    creator #association :creator, factory: :user
    event_time { Faker::Time.between(DateTime.now, DateTime.now + 60)}
    description "Fluffy's b-day party"
  end

  factory :invalid_event do

  end
end