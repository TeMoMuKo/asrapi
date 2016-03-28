FactoryGirl.define do
  factory :team do
    sequence(:name) { |n| "Team ##{n}" }

    after(:create) do |team|
      create_list(:user, 2, team: team)
    end
  end

end
