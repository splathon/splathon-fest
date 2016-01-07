FactoryGirl.define do
  factory :fest_kickoff do
    association :fest, factory: :fest, strategy: :build_stubbed
  end
end
