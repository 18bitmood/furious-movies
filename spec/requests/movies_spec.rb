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

  describe 'GET /movies/:id' do
    let!(:movie) { create :movie, name: 'TEST', imdb_id: 'test' }
    let!(:headers) { { 'ACCEPT' => 'application/json' } }

    subject! { get "/movies/#{movie.id}", headers: headers }

    context 'with existing id' do
      it 'returns movie info' do
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe 'PATCH /movies/:id' do
    let!(:movie) { create :movie, name: 'TEST', imdb_id: 'test' }
    let!(:headers) { { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' } }
    let!(:params) { { name: 'another name', price: 450 } }

    subject! { patch "/movies/#{movie.id}", headers: headers, params: params.to_json }

    context 'with existing id and valid params' do
      it 'updates existing movie params' do
        expect(response).to have_http_status(:success)
        movie.reload
        expect(movie.name).to eq(params[:name])
        expect(movie.price).to eq(params[:price])
      end
    end
  end

  describe 'DELETE /movies/:id' do
    let!(:movie) { create :movie, name: 'TO DELETE', imdb_id: 'test' }
    let!(:headers) { { 'ACCEPT' => 'application/json' } }

    subject { delete "/movies/#{movie.id}", headers: headers }

    context 'with existing id' do
      it 'deletes existing movie' do
        expect { subject }.to change { Movie.count }.by(-1)
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe 'GET /movies' do
    let!(:movie) { create :movie, name: 'TEST', imdb_id: 'test' }
    let!(:movie2) { create :movie, name: 'TEST2', imdb_id: 'test2' }
    let!(:headers) { { 'ACCEPT' => 'application/json' } }

    subject! { get '/movies', headers: headers }

    context 'when success' do
      it 'returns movies list' do
        expect(response).to have_http_status(:success)
        expect(JSON.parse(response.body)['total']).to eq 2
      end
    end
  end

  describe 'POST /update_all_prices' do
    let!(:movie) { create :movie, name: 'TEST', imdb_id: 'test', price: 111 }
    let!(:movie2) { create :movie, name: 'TEST2', imdb_id: 'test2', price: 222 }
    let!(:headers) { { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' } }
    let!(:params) { { price: 320 } }

    subject! { post '/update_all_prices', headers: headers, params: params.to_json }

    context 'when success' do
      it 'updates all movies prices' do
        expect(response).to have_http_status(:success)
        movie.reload
        movie2.reload
        expect(movie.price).to eq(params[:price])
        expect(movie2.price).to eq(params[:price])
      end
    end
  end

  describe 'GET /movies/:id/details' do
    let!(:movie) { create :movie, name: 'The Fast and the Furious', imdb_id: 'tt0232500' }
    let!(:headers) { { 'ACCEPT' => 'application/json' } }

    subject! { get "/movies/#{movie.id}/details", headers: headers }

    context 'with valid imdb_id' do
      it 'returns movie details with info from OMDB' do
        expect(response).to have_http_status(:success)
        expect(JSON.parse(response.body)['movie_details']['Title']).to eq 'The Fast and the Furious'
      end
    end
  end

  describe 'GET /all_movies' do
    let!(:movie) { create :movie, name: 'The Fast and the Furious', imdb_id: 'tt0232500' }
    let!(:movie2) { create :movie, name: 'some name', imdb_id: 'id' }
    let!(:headers) { { 'ACCEPT' => 'application/json' } }

    subject! { get "/all_movies", headers: headers }

    context 'when success' do
      it 'returns all movies with info from OMDB' do
        expect(response).to have_http_status(:success)
        expect(JSON.parse(response.body)['total']).to eq 2
        expect(JSON.parse(response.body)['movies'][0]['details']['Title']).to eq 'The Fast and the Furious'
      end
    end
  end
end
