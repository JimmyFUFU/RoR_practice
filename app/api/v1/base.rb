module V1
  class Base < Grape::API
    mount V1::Users::Signup
    mount V1::Users::Login

    mount V1::Lessons::Checkout
  end
end
