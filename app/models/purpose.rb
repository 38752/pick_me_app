class Purpose < ActiveHash::Base
  self.data = [
    { id: 1,  name: '会いたい' },
    { id: 2,  name: '話したい' },
    { id: 3,  name: 'ご飯食べたい' },
    { id: 4,  name: 'お茶したい' },
    { id: 5,  name: 'ゲームしたい' },
    { id: 6,  name: 'チャットしたい' },
    { id: 99, name: 'なんでも募集' }
  ]

  include ActiveHash::Associations
  has_many :hima_purposes

end