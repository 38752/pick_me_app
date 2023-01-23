class Hima < ApplicationRecord
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :open_range
  has_many :hima_purposes

  has_many :hit_ons


  # バリデーション
  validates :title, presence: true
  validates :text,  presence: true
end
