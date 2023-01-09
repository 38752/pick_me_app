class Sex < ActiveHash::Base
  self.data = [
    { id: 0, registration: '---',   profile: '未設定' },
    { id: 1, registration: '男性',   profile: '男性' },
    { id: 2, registration: '女性',   profile: '女性' },
    { id: 3, registration: 'その他', profile: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :users

end