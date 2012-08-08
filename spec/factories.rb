FactoryGirl.define do

  factory :user do
    name     "Michael Hartl"
    email    "example@railstutorial.org"
    password "foobar"
    password_confirmation "foobar"
  end

  factory :user_sequence, class: User do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}
    password "foobar"
    password_confirmation "foobar"
    factory :admin do
      admin true
    end
  end

  factory :micropost do
    content 'Yo, bro!'
    user
  end
end
