module Docs
  module Api
    module V1
      module Movies
        extend Dox::DSL::Syntax

        document :api do
          resource 'Movies' do
            endpoint '/movies'
            group 'Movies'
          end
        end

        document :create do
          action 'Create a movie'
        end

        document :show do
          action 'Show existing movie'
        end

        document :update do
          action 'Update existing movie'
        end

        document :delete do
          action 'Delete existing movie'
        end

        document :index do
          action 'Show movies list with pagination'
        end

        document :update_all_prices do
          action 'Set price for all movies'
        end

        document :get_movie_details do
          action 'Get movie detail with response from OMDB API'
        end

        document :get_all_movies_details do
          action 'Get all movies detail with response from OMDB API'
        end
      end
    end
  end
end
