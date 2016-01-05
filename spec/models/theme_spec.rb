require 'rails_helper'

RSpec.describe Theme do
  subject { FG.build(:theme) }

  it { is_expected.to be_valid }

  describe 'team attributes' do
    %i(alpha bravo).each do |team|
      it { is_expected.to be_invalid_on(team).with(nil) }
      it { is_expected.to be_invalid_on(team).with('') }

      it { is_expected.to be_valid_on(team).with(FFaker::Lorem.characters(32)) }
      it { is_expected.to be_invalid_on(team).with(FFaker::Lorem.characters(33)) }
    end
  end

  describe '#fest' do
    it { is_expected.to be_invalid_on(:fest).with(nil) }
  end

  describe '#to_s' do
    before do
      subject.alpha = 'ごはん'
      subject.bravo = 'パン'
    end

    it 'shows VS string' do
      expect(subject.to_s).to eq 'ごはん vs パン'
    end
  end
end
