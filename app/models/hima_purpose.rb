class HimaPurpose < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :hima
  belongs_to :purpose
end
