require "rails_helper"

RSpec.describe "Bearer", type: :request do
  let(:bearer) { create(:bearer) }

  describe 'POST api/v1/bearers' do
    let(:bearer) { Bearer.last }
    let(:params) { { bearer: { name: "My Bearer" } } }
    subject { post v1_bearers_path, params: params, as: :json }

    it 'returns a successful response' do
      subject

      expect(response).to have_http_status(:success)
    end

    it 'create a bearer' do
      expect { subject }.to change(Bearer, :count).by(1)
    end

    it 'returns the bearer' do
      subject

      expect(json[:bearer][:id]).to eq(bearer.id)
    end
  end
end
