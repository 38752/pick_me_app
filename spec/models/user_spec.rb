require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '登録できる' do
      it '登録できる' do
        expect(@user).to be_valid
      end
    end

    context '登録できない' do
      # nickname
      it 'nicknameが空(0文字)では登録できない' do
        @user.nickname = ''
        check_error_messages(@user, "Nickname is too short (minimum is 1 character)")
      end
      it 'nicknameが21字以上では登録できない' do
        @user.nickname = '123456789012345678901'
        check_error_messages(@user, "Nickname is too long (maximum is 20 characters)")
      end

      # email
      it 'emailが空では登録できない' do
        @user.email = ''
        check_error_messages(@user, "Email can't be blank")
      end
      it 'emailに@がないと登録できない' do
        @user.email = 'test.com'
        check_error_messages(@user, "Email is invalid")
      end
      it 'emailが一意でないと登録できない' do
        @user.save
        @another_user = FactoryBot.build(:user, email: @user.email)
        check_error_messages(@another_user, "Email has already been taken")
      end

      # password
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.password_confirmation = @user.password
        check_error_messages(@user, "Password can't be blank")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '1i1i1'
        @user.password_confirmation = @user.password
        check_error_messages(@user, "Password is too short (minimum is 6 characters)")
      end
      it 'passwordが129文字以上では登録できない' do
        @user.password = Faker::Internet.password(min_length: 129)
        @user.password_confirmation = @user.password
        check_error_messages(@user, "Password is too long (maximum is 128 characters)")
      end
      it 'passwordとpassword_confirmationが異なると登録できない' do
        @user.password += 'l'
        check_error_messages(@user, "Password confirmation doesn't match Password")
      end
    end
  end

  describe 'ユーザー更新' do
    before do
      @user.save
      @user.nickname = Faker::Name.initials(number: 10)
      @user.how_old_id = Faker::Number.within(range: 0..5) * 10
      @user.sex_id = Faker::Number.within(range: 0..3)
      @user.introduction = Faker::Lorem.paragraph(sentence_count: 5)
      @user.images.attach(io: File.open('public/images/valid_size.png'), filename: 'valid_size.png')
    end

    context '更新できる' do
      it '更新できる' do
        expect(@user).to be_valid
      end

      it 'imagesが添付されていなくても更新できる' do
        @user.images = nil
        expect(@user).to be_valid
      end

      it 'introductionが空でも更新できる' do
        @user.introduction = ''
        expect(@user).to be_valid
      end
    end

    context '更新できない' do
      # nickname
      it 'nicknameが空(0文字)では更新できない' do
        @user.nickname = ''
        check_error_messages(@user, "Nickname is too short (minimum is 1 character)")
      end
      it 'nicknameが21字以上では更新できない' do
        @user.nickname = '123456789012345678901'
        check_error_messages(@user, "Nickname is too long (maximum is 20 characters)")
      end

      # images
      it 'imagesが4つ以上では更新できない' do
        3.times do
          @user.images.attach(io: File.open('public/images/valid_size.png'), filename: 'valid_size.png')
        end
        check_error_messages(@user, "Images of more than 3 cannot be attached")
      end
      it 'imagesのサイズが5KB未満では更新できない' do
        @user.images.attach(io: File.open('public/images/4KB.jpeg'), filename: '4KB.jpeg')
        check_error_messages(@user, "Images File size should be greater than 5 KB")
      end
      it 'imagesのサイズが1MBより大きくては更新できない' do
        @user.images.attach(io: File.open('public/images/2MB.jpeg'), filename: '2MB.jpeg')
        check_error_messages(@user, "Images File size should be less than 1 MB")
      end
      it 'imagesの拡張子が異なっていれば更新できない' do
        @user.images.attach(io: File.open('public/images/invalid_ extension.gif'), filename: 'invalid_ extension.gif')
        check_error_messages(@user, "Images is not a valid file format")
      end
    end
  end

  private

  def big
    binding.pry
  end
end
