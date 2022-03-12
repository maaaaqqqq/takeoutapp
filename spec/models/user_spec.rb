require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
    sleep 0.1
  end

  describe 'ユーザーの新規登録' do
    context '新規登録できる場合' do
      it 'name,email,password,name_kana,telが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上かつ英数字混合であれば登録できる' do
        @user.password = '123ett'
        @user.password_confirmation = '123ett'
        expect(@user).to be_valid
      end
    end

    context '新規登録ができない場合' do
      it 'nameが空では登録できない' do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'name_kanaが空では登録できない' do
        @user.name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name kana can't be blank")
      end
      it 'telが空では登録できない' do
        @user.tel = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Tel can't be blank")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが5文字以下であれば登録できない' do
        @user.password = 'pass0'
        @user.password_confirmation = 'pass0'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが数字だけであれば登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid. Include both letters and numbers')
      end
      it 'passwordが英字だけであれば登録できない' do
        @user.password = 'password'
        @user.password_confirmation = 'password'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid. Include both letters and numbers')
      end
      it 'name_kanaが全角カタカナ以外であれば登録できない' do
        @user.name_kana = '長岡'
        @user.valid?
        expect(@user.errors.full_messages).to include('Name kana is invalid. Input full-width katakana characters')
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it '全角文字を含むパスワードは登録できない' do
        @user.password = 'ＡＢＣ１２３'
        @user.password_confirmation = 'ＡＢＣ１２３'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid. Include both letters and numbers')
      end
      it 'emailに@を含まない場合は登録できない' do
        @user.email = 'tanaka.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'telが半角ハイフン(-)を含む形では保存できない' do
        @user.tel = '999-9999-9999'
        @user.valid?
        expect(@user.errors.full_messages).to include('Tel is invalid', 'Tel is not a number')
      end
      it '全角数字を含むtelは保存できない' do
        @user.tel = '９９９９９９９９９９９'
        @user.valid?
        expect(@user.errors.full_messages).to include('Tel is invalid', 'Tel is not a number')
      end
      it 'telが9桁以下では保存できない' do
        @user.tel = '99999999'
        @user.valid?
        expect(@user.errors.full_messages).to include('Tel is invalid')
      end
      it 'telは12桁以上では保存できない' do
        @user.tel = '999999999999'
        @user.valid?
        expect(@user.errors.full_messages).to include('Tel is invalid')
      end
    end
  end
end
