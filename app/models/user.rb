class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #  プロフィールに関するアソシエーション
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :sex
  belongs_to :how_old
  belongs_to :status
  has_many_attached :images

  has_many :himas
  has_many :hit_ons

  # Memoモデルとのアソシエーション
  has_many :memoes,         class_name: "Memo", foreign_key: "subject_id", dependent: :destroy
  has_many :reverse_memoes, class_name: "Memo", foreign_key: "object_id",  dependent: :destroy

  # Relationshipモデルとのアソシエーション
  # subjectがフォローしたり、アンフォローしたりするための記述
  has_many :relationships, class_name: "Relationship", foreign_key: "subject_id", dependent: :destroy
  #sourceは本当はobject_idとなっていてカラム名を示している。
  # フォロー一覧を表示するための記述
  has_many :objects, through: :relationships, source: :object

  has_many :reverse_relationships, class_name: "Relationship", foreign_key: "object_id", dependent: :destroy
  # フォロワー一覧を表示するための記述
  has_many :subjects, through: :reverse_relationships, source: :subjects

  # バリデーション
  validates :nickname, presence: true

  validates :images, attached_file_number: { maximum: 3 }
  validates :images, blob: { content_type: :image, size_range: (5.kilobytes)..(1.megabytes) }

end
