FactoryGirl.define do
  factory :event do
    creator #association :creator, factory: :user
    location "123 N Main St, Chicago, IL 60660"
    event_start { DateTime.now }
    event_end { DateTime.now }
    description "Fluffy's b-day party"
  end
end
