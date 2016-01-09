require 'rails_helper'

RSpec.describe Player do
  subject { FG.build(:player) }

  it { is_expected.to be_valid }

  describe '#name' do
    it { is_expected.to be_invalid_on(:name).with(nil) }
    it { is_expected.to be_invalid_on(:name).with('') }
    it { is_expected.to be_valid_on(:name).with(FFaker::Lorem.characters(16)) }
    it { is_expected.to be_invalid_on(:name).with(FFaker::Lorem.characters(17)) }
  end
end
