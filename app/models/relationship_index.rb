class RelationshipIndex < ActiveHash::Base
  self.data = [
    { id:    0, name: 'フォロー解除中' },
    { id: 1000, name: 'フォロー中' },
  ]

  include ActiveHash::Associations
  has_many :relationships

end