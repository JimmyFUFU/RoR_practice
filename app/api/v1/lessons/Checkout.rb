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
          thisUser = User.find_by(access_token: headers['Authorization'])
          if !thisUser
            status 403
            { error: "Invalid Access Token" }
          else
            thisLesson = Lesson.find_by(id: params[:lesson_id])
            if !thisLesson
              status 400
              { error: "Lesson Not Found" }
            elsif thisLesson.status == "soldOut"
              status 400
              { error: "Lesson Sold Out" }
            else
              orders = Order.where(lesson_id: params[:lesson_id], user_id: thisUser.id)
              if orders.size != 0 and orders[orders.size-1].expired_time >= Date.today
                status 400
                { error: "You are Already have this lesson" }
              else
                newOrder = Order.new( lesson_id: thisLesson.id, user_id: thisUser.id, checkout_time: Date.today, expired_time: Date.today+thisLesson.expired_days, total: thisLesson.price, currency:thisLesson.currency)
                if newOrder.save
                status 200
                { msg: "checkout successfully"}
                else
                status 400
                { error: "Database error"}
                end
              end
            end
          end
        end
      end
    end
  end
end
