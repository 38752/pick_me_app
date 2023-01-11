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
  validates :images, blob: { content_type: :image }

  # Memoモデルとのアソシエーション
  has_many :memoes,         class_name: "Memo", foreign_key: "subject_id", dependent: :destroy
  has_many :reverse_memoes, class_name: "Memo", foreign_key: "object_id",  dependent: :destroy
end
