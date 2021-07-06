require 'rails_helper'

RSpec.describe 'Showtimes', type: :request do
  describe 'POST /movies/:id/showtimes' do
    let(:movie) { create :movie, name: 'TEST', imdb_id: 'test' }
    let(:params) { { showtime: DateTime.now + 1.day } }
    let(:headers) { { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' } }

    subject { post "/movies/#{movie.id}/showtimes", params: params.to_json, headers: headers }

    context 'with valid params' do
      it 'creates showtime' do
        expect { subject }.to change { Showtime.count }.by(1)
        expect(response).to have_http_status(:success)
      end
    end

    context 'with invalid params' do
      let!(:params) { { showtime: DateTime.now.to_s.gsub(':', 'a').gsub('-', 'b') } }

      it "doesn't create rating" do
        expect { subject }.to_not(change { Showtime.count })
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'GET /movies/:id/showtimes' do
    let!(:movie) { create :movie, name: 'TEST', imdb_id: 'test' }
    let!(:showtimefuture) { create :showtime, movie_id: movie.id, showtime: DateTime.now + 1.day }
    let!(:showtimepast) { create :showtime, movie_id: movie.id, showtime: DateTime.now - 1.day }
    let(:params) {{ }}
    let(:headers) { { 'ACCEPT' => 'application/json' } }

    subject! { get "/movies/#{movie.id}/showtimes", params: params, headers: headers }

    context 'without including=all in params' do
      it 'returns only future showtimes' do
        expect(response).to have_http_status(:success)
        expect(JSON.parse(response.body)['total']).to eq 1
      end
    end

    context 'with including=all in params' do
      let!(:params) {{ including: 'all' }}

      it 'returns all showtimes' do
        expect(response).to have_http_status(:success)
        expect(JSON.parse(response.body)['total']).to eq 2
      end
    end
  end
end
