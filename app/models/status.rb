class Status < ActiveHash::Base
  self.data = [
    { id: 1000, name: '新規登録済み' }
  ]

  include ActiveHash::Associations
  has_many :users

end