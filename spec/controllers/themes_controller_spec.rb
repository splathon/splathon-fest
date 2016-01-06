require 'rails_helper'

RSpec.describe ThemesController do
  describe 'POST #create' do
    let(:fest) { FG.create(:fest) }
    let(:attrs) { FG.attributes_for(:theme) }

    it 'creates new theme and redirect_to fest' do
      expect { post :create, fest_id: fest.id, theme: attrs }
        .to change(fest.themes, :count).by(1)
      expect(response).to redirect_to fest_path(fest)
    end

    describe 'when theme params are invalid' do
      before { attrs[:alpha] = '' }
      it 'does NOT create theme and show errors' do
        expect { post :create, fest_id: fest.id, theme: attrs }.not_to change(Theme, :count)
        expect(response).to have_http_status(:success)
        expect(response).to render_template('fests/show')
        expect(assigns(:theme).errors).not_to be_empty
      end
    end

    describe 'when fest_id is invalid' do
      let(:fest_id) { 9999 }
      before { Fest.destroy_all(id: 9999) }
      it 'does NOT create theme and redirect to fests' do
        expect { post :create, fest_id: fest_id, theme: attrs }.not_to change(Theme, :count)
        expect(response).to redirect_to fests_path
      end
    end
  end
end
