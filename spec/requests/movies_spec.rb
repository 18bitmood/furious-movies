require 'rails_helper'

RSpec.describe 'Movies', type: :request do
  describe 'POST /movies' do
    let(:params) { { name: 'Movie', imdb_id: 'imdb' } }
    let(:headers) { { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' } }

    subject { post '/movies', params: params.to_json, headers: headers }

    context 'with valid params' do
      it 'creates movie' do
        expect { subject }.to change { Movie.count }.by(1)
        expect(response).to have_http_status(:success)
      end
    end

    context 'with invalid params' do
      let!(:params) { { name: 0 } }

      it "doesn't create movie" do
        expect { subject }.to_not(change { Movie.count })
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end

  # describe 'GET /update' do
  #   it 'returns http success' do
  #     get '/movies/update'
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  # describe 'GET /destroy' do
  #   it 'returns http success' do
  #     get '/movies/destroy'
  #     expect(response).to have_http_status(:success)
  #   end
  # end
# end
