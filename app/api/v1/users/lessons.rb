module V1
  module Users
    class Lessons < Grape::API
      version 'v1', using: :path
      format :json
      prefix :api

      resource :user do
        desc "show user's lesson"
        get :lessons do
          thisUser = User.find_by(access_token: headers['Authorization'])
          if !thisUser
            status 403
            return {error: "Invalid Access Token"}
          else
            orders = Order.where(user_id: thisUser.id)
            returnObj = {user_id: thisUser.id, user_name: thisUser.name, order: []}
            orders.each do |order|
              thisLesson = Lesson.find_by(id: order.lesson_id)
              swag = false
              swag = true if params[:status] == thisLesson.status and params[:category] == thisLesson.category
              swag = true if params[:status] == thisLesson.status and !params[:category]
              swag = true if !params[:status] and params[:category] == thisLesson.category
              swag = true if !params[:status] and !params[:category]
              if swag
                returnObj[:order].push({
                  id: order.id,
                  checkout_time: order.checkout_time ,
                  expired_time: order.expired_time,
                  total: order.total,
                  currency: order.currency ,
                  lesson: {
                    id: thisLesson.id,
                    title: thisLesson.title,
                    price: thisLesson.price ,
                    currency: thisLesson.currency,
                    category: thisLesson.category ,
                    url: thisLesson.url ,
                    description: thisLesson.description
                  }
                })
              end
            end
            status 200
            return returnObj
          end
        end
      end
    end
  end
end
