class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :sex
  belongs_to :how_old
  belongs_to :status
  has_many_attached :images

  has_many :himas

  validates :nickname, presence: true
  validates :images, attached_file_number: { maximum: 3 }
  validates :images, blob: { content_type: :image, size_range: (10.kilobytes)..(1.megabytes) }
end
