module V1
  module Lessons
    class Checkout < Grape::API
      version 'v1', using: :path
      format :json
      prefix :api

      resource :lessons do
        desc 'Purchase lesson'
        post :checkout do
          puts "checkout"
          puts headers['Authorization']
        end
      end
    end
  end
end
