class RelationshipIndex < ActiveHash::Base
  self.data = [
    { id: 1000, name: 'フォロー中' },
    { id: 2000, name: 'フォロー解除中' },
  ]

  include ActiveHash::Associations
  has_many :relationships

end