require 'rails_helper'

RSpec.describe 'Ratings', type: :request do
  include Docs::Api::V1::Ratings::Api

  describe 'POST /movies/:id/ratings' do
    include Docs::Api::V1::Ratings::Create
    
    let(:movie) { create :movie, name: 'TEST', imdb_id: 'test' }
    let(:params) { { mark: 4 } }
    let(:headers) { { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' } }

    subject { post "/movies/#{movie.id}/ratings", params: params.to_json, headers: headers }

    context 'with valid params' do
      it 'creates rating', :dox do
        expect { subject }.to change { Rating.count }.by(1)
        expect(response).to have_http_status(:success)
        expect(movie.ratings.first.mark).to eq params[:mark]
      end
    end

    context 'with invalid params' do
      let!(:params) { { mark: 'a' } }

      it "doesn't create rating" do
        expect { subject }.to_not(change { Rating.count })
        expect(response).to have_http_status(:unprocessable_entity)
        expect(movie.ratings.blank?).to eq true
      end
    end
  end

  describe 'GET /movies/:id/ratings' do
    include Docs::Api::V1::Movies::Index

    let(:movie) { create :movie, name: 'TEST', imdb_id: 'test' }
    let!(:rating1) { create :rating, movie_id: movie.id, mark: rand(1..5) }
    let!(:rating2) { create :rating, movie_id: movie.id, mark: rand(1..5) }
    let!(:rating3) { create :rating, movie_id: movie.id, mark: rand(1..5) }
    let(:headers) { { 'ACCEPT' => 'application/json' } }

    subject! { get "/movies/#{movie.id}/ratings", headers: headers }

    context 'with existing ratings' do
      it 'show movies ratings', :dox do
        expect(JSON.parse(response.body)['total']).to eq 3
      end
    end
  end
end
