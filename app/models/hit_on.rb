class HitOn < ApplicationRecord
  attr_accessor :hima_owner_id

  belongs_to :user
  belongs_to :hima

  validates :line, presence: true
  validates :user_id, numericality: { other_than: :hima_owner_id, message: "and hima's owner must be different" }
  validates :user_id, uniqueness: { scope: :hima_id, message: "is allowed to send only 1 request per 1 hima" }
end
