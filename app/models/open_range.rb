class OpenRange < ActiveHash::Base
  self.data = [
    { id: 10, name: '全員に公開' },
    { id: 98, name: '公開を停止(管理者権限)' },
    { id: 99, name: '公開を停止' }
  ]

  include ActiveHash::Associations
  has_many :himas

end