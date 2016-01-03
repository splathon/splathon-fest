require 'rails_helper'

RSpec.describe FestsController do
  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #create' do
    let(:attrs) { FG.attributes_for(:fest) }
    it 'creates new fest and redirect_to #index' do
      expect { post :create, fest: attrs }.to change(Fest, :count).by(1)
      expect(response).to redirect_to :fests
    end

    describe 'when fest params are invalid' do
      before { attrs[:name] = '' }
      it 'does NOT create fest and show errors' do
        expect { post :create, fest: attrs }.not_to change(Fest, :count)
        expect(response).to have_http_status(:success)
        expect(response).to render_template(:index)
        expect(assigns(:fest).errors).not_to be_empty
      end
    end
  end
end
