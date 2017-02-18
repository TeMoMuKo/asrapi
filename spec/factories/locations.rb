FactoryGirl.define do
  factory :location do
    latitude { Faker::Address.latitude }
    longitude { Faker::Address.longitude }
    message "Imprezowóz już jedzie!"
    association :team
  end

end
