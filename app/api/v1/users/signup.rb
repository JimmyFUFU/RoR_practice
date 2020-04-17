module V1
  module Users
    class Signup < Grape::API
      version 'v1', using: :path
      format :json
      prefix :api

      resource :user do
        desc 'User sign up'
        post :signup do
          token = Digest::MD5.hexdigest(params[:email] + Time.now.to_s)
          params[:password] = Digest::MD5.hexdigest(params[:password])
          user = User.new(name: params[:name], email: params[:email], password: params[:password], access_token: token)
          if user.save
            thisUser = User.find_by(email: params[:email])
            status 200
            {
              access_token: thisUser.access_token,
              user: {
                id: thisUser.id,
                name: thisUser.name,
                email: thisUser.email
              }
            }
          else
            status 400
            {
              error: "Sign Up Failed"
            }
          end
        end
      end
    end
  end
end
