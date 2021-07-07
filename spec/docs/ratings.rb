module Docs
  module Api
    module V1
      module Ratings
        extend Dox::DSL::Syntax

        document :api do
          resource 'Ratings' do
            endpoint '/ratings'
            group 'Ratings'
          end
        end

        document :create do
          action 'Create a rating for existing movie'
        end

        document :index do
          action 'Show all ratings for movie'
        end
      end
    end
  end
end
