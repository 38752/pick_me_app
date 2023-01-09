class HowOld < ActiveHash::Base
  self.data = [
    { id: 0,  registration: '---', profile:    '未設定' },
    { id: 10, registration: '10代', profile:   '10代' },
    { id: 20, registration: '20代', profile:   '20代' },
    { id: 30, registration: '30代', profile:   '30代' },
    { id: 40, registration: '40代', profile:   '40代' },
    { id: 50, registration: '50代〜', profile: '50代〜' }
  ]

  include ActiveHash::Associations
  has_many :users

end