class Message < ApplicationRecord
  belongs_to :room, touch: true
  belongs_to :user

  validates :content, presence: true
end
