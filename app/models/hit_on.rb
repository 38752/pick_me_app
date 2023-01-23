class HitOn < ApplicationRecord
  attr_accessor :hima_owner_id, :this_hima

  belongs_to :user
  belongs_to :hima
  has_one :room, dependent: :destroy

  validates :this_hima, numericality: {  equal_to: 10, message: "has already been deleted" }
  validates :user_id,   numericality: { other_than: :hima_owner_id, message: "and hima's owner must be different" }
  validates :user_id,   uniqueness: { scope: :hima_id, message: "is allowed to send only 1 request per 1 hima" }
  validates :line,      presence: true
end
