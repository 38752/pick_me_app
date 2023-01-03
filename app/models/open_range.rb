class OpenRange < ActiveHash::Base
  self.data = [
    { id: 10, name: '全員に公開' }
  ]

  include ActiveHash::Associations
  has_many :himas

end