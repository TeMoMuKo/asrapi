FactoryGirl.define do
  factory :user do
    first_name "Jan"
    last_name "Nowak"
    sequence(:email) { |n| "#{first_name}.#{last_name}#{n}@example.com" }
    password "qweasdzxc"
  end
end
