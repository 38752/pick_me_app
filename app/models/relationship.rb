class Relationship < ApplicationRecord
  belongs_to :subject, class_name: "User"
  belongs_to :object,  class_name: "User"

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :relationship_index

  validates :subject_id, uniqueness: { scope: :object_id, message: "and object are already registrated  as a pair" }
end