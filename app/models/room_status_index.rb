class RoomStatusIndex < ActiveHash::Base
  self.data = [
    { id:  0, name: '却下済み' },
    { id: 10, name: 'リクエスト済み' },
    { id: 20, name: 'トーク中' },
    { id: 99, name: 'クローズ済み' },
  ]

  include ActiveHash::Associations
  has_many :rooms

end