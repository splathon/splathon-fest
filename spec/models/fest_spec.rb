require 'rails_helper'

RSpec.describe Fest do
  subject { FG.build(:fest) }

  it { is_expected.to be_valid }

  describe '#name' do
    it { is_expected.to be_invalid_on(:name).with(nil) }
    it { is_expected.to be_invalid_on(:name).with('') }

    it { is_expected.to be_valid_on(:name).with(FFaker::Lorem.characters(255)) }
    it { is_expected.to be_invalid_on(:name).with(FFaker::Lorem.characters(256)) }
  end

  describe '#to_s' do
    it 'returns name' do
      expect(subject.to_s).to eq subject.name
    end
  end
end
