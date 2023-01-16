class Room < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :room_status_index

  belongs_to :hit_on
  belongs_to :room_master, class_name: "User"
  has_many   :room_users,  dependent: :destroy
  has_many   :users,       through: :room_users
end
