FactoryGirl.define do
  factory :player do
    name { FFaker::NameJA.name }
    association :fest, factory: :fest, strategy: :build
  end
end
