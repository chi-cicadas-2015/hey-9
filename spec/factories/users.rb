FactoryGirl.define do
  factory :user, aliases: [:author, :commenter, :creator, :owner] do
    username { Faker::Internet.user_name }
    email { "#{username}@email.com".downcase }
    password { Faker::Internet.password }
  end
end
