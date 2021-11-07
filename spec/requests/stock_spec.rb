require "rails_helper"

RSpec.describe "Stock", type: :request do
  let(:bearer) { create(:bearer) }

  describe 'POST api/v1/stocks' do
    let(:stock) { Stock.last }
    let(:params) { { stock: { name: "My Stock", bearer_id: bearer.id } } }
    subject { post v1_stocks_path, params: params, as: :json }

    it 'returns a successful response' do
      subject

      expect(response).to have_http_status(:success)
    end

    it 'create a Stock' do
      expect { subject }.to change(Stock, :count).by(1)
    end

    it 'returns the stock' do
      subject

      expect(json[:stock][:id]).to eq(stock.id)
    end
  end

  describe 'PUT api/v1/stock/:id' do
    let(:stock) { create(:stock) }

    context 'with valid params' do
      let(:params) { { stock: { name: "updated name" } } }

      subject { put v1_stock_path(stock.id), params: params, as: :json }
      
      it 'returns success' do
        subject

        expect(response).to have_http_status(:success)
      end

      it 'updates the stock' do
        subject

        expect(stock.reload.name).to eq(params[:stock][:name])
      end
    end

    context 'with invalid params' do
      let!(:new_stock) { create(:stock, name: 'new stock')}

      let(:params) { { stock: { name: "new stock" } } }

      subject { put v1_stock_path(stock.id), params: params, as: :json }

      it 'does not return success' do
        subject

        expect(response).to_not have_http_status(:success)
      end

      it 'returns the error' do
        subject

        expect(json[:errors][:message]).to eq("name"=>["has already been taken"])
      end
    end

    context 'with missing params' do
      it 'returns the missing params error' do
        put v1_stock_path(stock.id), params: { stock: {} }, as: :json

        expect(json[:errors][:message]).to eq('A required param is missing')
      end
    end
  end
end
