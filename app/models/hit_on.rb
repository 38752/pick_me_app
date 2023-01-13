class HitOn < ApplicationRecord
  # attr_accessor :hima_owner_id

  belongs_to :user
  belongs_to :hima

  # validates :user_id, comparison: { other_than: :hima_owner_id }
  validates :user_id, uniqueness: { scope: :hima_id }
end
