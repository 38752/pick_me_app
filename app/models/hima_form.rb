class HimaForm
  include ActiveModel::Model
  Purpose.all.each do |purpose|
    attr_accessor("purpose_#{purpose.id}")
    validates :"purpose_#{purpose.id}", presence: true
  end
  attr_accessor(
    :user_id, :title, :location, :text, :open_range_id, :purposes
  )

  validates :title, :text, :user_id, presence: true

  def save
    hima = Hima.create(title: title, location: location, text: text, open_range_id: open_range_id, user_id: user_id)
    Purpose.all.each do |purpose|
      HimaPurpose.create(hima_id: hima.id, purpose_id: purpose.id, flag: purposes[:"purpose_#{purpose.id}"])
    end
  end

end