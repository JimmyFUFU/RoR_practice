module V1
  module Users
    class Lesson < Grape::API
      version 'v1', using: :path
      format :json
      prefix :api

      resource :user do
        desc "show user's lesson"
        get :lesson do
          
        end
      end
    end
  end
end
