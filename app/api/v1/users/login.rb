module V1
  module Users
    class Login < Grape::API
      version 'v1', using: :path
      format :json
      prefix :api

      resource :user do
        desc 'User log in'
        post :login do
          puts "log in"
          thisUser = User.find_by(email: params[:email])
          if thisUser and thisUser.password == Digest::MD5.hexdigest(params[:password])
            token = Digest::MD5.hexdigest(params[:email] + Time.now.to_s)
            thisUser.update_attribute(:access_token, token)
            {
              access_token: token,
              user: {
                id: thisUser.id,
                name: thisUser.name,
                email: thisUser.email
              }
            }
          else
            {
              error: "Log in Failed"
            }
          end
        end
      end
    end
  end
end
