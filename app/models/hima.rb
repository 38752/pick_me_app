class Hima < ApplicationRecord
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :open_range
  # has_many :purposes
  # has_many :hit_ons

  validates :title, :text, presence: true

end
