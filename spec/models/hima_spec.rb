require 'rails_helper'

RSpec.describe Hima, type: :model do
  before do
    @hima = FactoryBot.build(:hima)
  end

  describe 'hima新規投稿' do
    context '投稿できる' do
      it '投稿できる' do
        expect(@hima).to be_valid

        @hima.save
        @purpose_list = build_purposes(@hima)
        @purpose_list.each do |hima_purpose|
          expect(hima_purpose).to be_valid
        end
      end

      it 'locationが空でも投稿できる' do
        @hima.location = ''
        expect(@hima).to be_valid

        @hima.save
        @purpose_list = build_purposes(@hima)
        @purpose_list.each do |hima_purpose|
          expect(hima_purpose).to be_valid
        end
      end
    end

    context '投稿できない' do
      # title
      it 'titleが空では投稿できない' do
        @hima.title = ''
        check_error_messages(@hima, "Title can't be blank")
      end

      # text
      it 'textが空では投稿できない' do
        @hima.text = ''
        check_error_messages(@hima, "Text can't be blank")
      end

      # user
      it 'userが紐づいていなければ投稿できない' do
        @hima.user = nil
        check_error_messages(@hima, "User must exist")
      end
    end
  end

  private

  def build_purposes(hima)
    purpose_list = []
    Purpose.all.each do |purpose|
      purpose_list << FactoryBot.build(:hima_purpose, purpose_id: purpose.id, hima_id: hima.id)
    end

    return purpose_list
  end
end
