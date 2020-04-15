class Order < ApplicationRecord
  validates :lesson_id, presence: true
  validates :user_id, presence: true
  validates :checkout_time, presence: true
  validates :expired_time, presence: true
  validates :total, presence: true
  validates :currency, presence: true
end
