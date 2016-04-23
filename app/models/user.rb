class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :offers, foreign_key: :carrier_id
  has_many :requests, foreign_key: :requester_id
  has_many :messages
  has_many :travel_plans
  has_many :comments, dependent: :destroy
end
