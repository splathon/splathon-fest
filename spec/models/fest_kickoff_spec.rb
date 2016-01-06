require 'rails_helper'

RSpec.describe FestKickoff do
  subject { FG.build(:fest_kickoff) }

  it { is_expected.to be_valid }

  it { is_expected.to be_invalid_on(:fest_id).with(nil) }
  context 'when there are no Fest whose id equals to fest_id' do
    before { subject.fest_id = 9999 }
    before { Fest.destroy_all(id: 9999) }
    it 'has an error on fest' do
      expect(subject).not_to be_valid
      expect(subject.errors[:fest].size).to be > 0
    end
  end

  context 'when fest is opened' do
    before { subject.fest.status = 'opened' }
    it 'has an error on fest' do
      expect(subject).not_to be_valid
      expect(subject.errors[:fest].size).to be > 0
    end
  end

  describe '#fest' do
    context 'when set valid fest_id' do
      let(:fest) { FG.create(:fest) }
      before { subject.fest_id = fest.id }
      it 'returns a Fest whose id equals to fest_id' do
        expect(subject.fest).to eq fest
      end
    end

    context 'when set invalid fest_id' do
      before { subject.fest_id = 9999 }
      before { Fest.destroy_all(id: 9999) }
      it 'returns nil' do
        expect(subject.fest).to be_nil
      end
    end
  end

  describe '#fest=' do
    context 'when arg is valid Fest' do
      let(:fest) { FG.build_stubbed(:fest) }
      before { subject.fest = fest }
      it 'sets fest and fest_id' do
        expect(subject.fest).to eq fest
        expect(subject.fest_id).to eq fest.id
      end
    end

    context 'when arg is nil' do
      before { subject.fest = nil }
      it 'sets nil to fest and fest_id' do
        expect(subject.fest).to be_nil
        expect(subject.fest_id).to be_nil
      end
    end
  end

  describe '#save' do
    context 'when it is valid' do
      let(:fest) { FG.create(:fest) }
      before { subject.fest = fest }
      it 'returns true' do
        expect(subject.save).to be_truthy
      end
      it 'changes fest status' do
        expect { subject.save }.to change(fest, :status).to('opened')
      end
    end

    context 'when it is invalid' do
      before { subject.fest = nil }
      it 'returns false' do
        expect(subject.save).to be_falsy
      end
    end
  end
end
