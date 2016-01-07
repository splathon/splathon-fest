require 'rails_helper'

RSpec.describe FestKickoffsController do
  describe 'POST #create' do
    let(:fest) { FG.create(:fest) }

    context 'when fest is in preparation' do
      it 'opens the fest' do
        expect { post :create, fest_id: fest.id }
          .to change { fest.reload.status }.to('opened')
        expect(response).to redirect_to fest_path(fest)
      end
    end

    describe 'when fest is already opened' do
      before { fest.update(status: 'opened') }
      it 'does NOT open fest' do
        expect { post :create, fest_id: fest.id }
          .not_to change { fest.reload.status }
        expect(response).to redirect_to(fest_path(fest))
      end
    end

    describe 'when fest does NOT exist' do
      before { Fest.destroy_all(id: 9999) }
      it 'redirects to fests' do
        post :create, fest_id: 9999
        expect(response).to redirect_to(fests_path)
      end
    end
  end
end
