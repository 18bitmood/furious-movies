module Docs
  module Api
    module V1
      module Showtimes
        extend Dox::DSL::Syntax

        document :api do
          resource 'Showtimes' do
            endpoint '/Showtimes'
            group 'Showtimes'
          end
        end

        document :create do
          action 'Create a showtime for existing movie'
        end

        document :index do
          action 'Show all showtimes for movie'
        end
      end
    end
  end
end
