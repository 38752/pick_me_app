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
  has_many_attached :images, dependent: :destroy

  has_many :himas, dependent: :destroy
  has_many :hit_ons, dependent: :destroy

  # Memoモデルとのアソシエーション
  has_many :memos,         class_name: "Memo", foreign_key: "subject_id", dependent: :destroy
  has_many :reverse_memos, class_name: "Memo", foreign_key: "object_id",  dependent: :destroy

  # Relationshipモデルとのアソシエーション
  # subjectがフォローしたり、アンフォローしたりするための記述
  has_many :relationships, class_name: "Relationship", foreign_key: "subject_id", dependent: :destroy
  # フォロー一覧を表示するための記述  sourceは本当はobject_idとなっていてカラム名を示している
  has_many :objects, through: :relationships, source: :object, dependent: :destroy

  has_many :reverse_relationships, class_name: "Relationship", foreign_key: "object_id", dependent: :destroy
  # フォロワー一覧を表示するための記述
  has_many :subjects, through: :reverse_relationships, source: :subjects, dependent: :destroy

  # room関連のアソシエーション
  has_many :own_rooms, class_name: "Room", foreign_key: "room_master_id", dependent: :destroy
  has_many :room_users, dependent: :destroy
  has_many :rooms, through: :room_users, dependent: :destroy

  # Messageモデルとのアソシエーション
  has_many :messages, dependent: :destroy

  # バリデーション
  validates :nickname, presence: true

  validates :images, attached_file_number: { maximum: 3 }
  validates :images, blob: { content_type: :image, size_range: (5.kilobytes)..(1.megabytes) }

end
