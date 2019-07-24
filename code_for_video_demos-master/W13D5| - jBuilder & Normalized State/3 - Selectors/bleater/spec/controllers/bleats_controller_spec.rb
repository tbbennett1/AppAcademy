require 'rails_helper'

RSpec.describe BleatsController, type: :controller do

  describe "GET #index" do
    it "renders the bleats index" do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "GET #new" do
    it "render the bleats new" do
      allow(subject).to receive(:logged_in?).and_return(true)
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "DELETE #destroy" do
    let(:bleat) { create(:bleat) }

    before(:each) do
      allow(subject).to receive(:current_user).and_return(bleat.author)
      delete :destroy, params: {id: bleat.id}
    end

    it "destroys the bleat" do
      expect(Bleat.exists?(id: bleat.id)).to be(false)
    end

    it "redirects to bleats_url" do
      # expect(response).to have_http_status(302)
      expect(response).to redirect_to(bleats_url)
    end
  end

end