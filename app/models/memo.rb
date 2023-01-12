class Memo < ApplicationRecord
  belongs_to :subject, class_name: "User"
  belongs_to :object,  class_name: "User"

  validates :subject_id, uniqueness: { scope: :object_id }
end
