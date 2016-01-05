FactoryGirl.define do
  factory :theme do
    alpha { FFaker::Lorem.word }
    bravo { FFaker::Lorem.word }
    association :fest, factory: :fest, strategy: :build
  end
end
