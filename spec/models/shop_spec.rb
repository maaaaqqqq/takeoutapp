require 'rails_helper'

RSpec.describe Shop, type: :model do
  before do
    @shop = FactoryBot.build(:shop)
    sleep 0.1
  end

  describe '飲食店の新規登録' do
    context '新規登録できる場合' do
      it 'name,email,password,name_kana,text,address,holiday,parking_id,genre_id,telが存在すれば登録できる' do
        expect(@shop).to be_valid
      end
      it 'passwordが6文字以上かつ英数字混合であれば登録できる' do
        @shop.password = '123ett'
        @shop.password_confirmation = '123ett'
        expect(@shop).to be_valid
      end
      it 'building_nameは空でも保存できる' do
        @shop.building_name = ''
        expect(@shop).to be_valid
      end
    end

    context '新規登録ができない場合' do
      it 'nameが空では登録できない' do
        @shop.name = ''
        @shop.valid?
        expect(@shop.errors.full_messages).to include("Name can't be blank")
      end
      it 'emailが空では登録できない' do
        @shop.email = ''
        @shop.valid?
        expect(@shop.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空では登録できない' do
        @shop.password = ''
        @shop.valid?
        expect(@shop.errors.full_messages).to include("Password can't be blank")
      end
      it 'name_kanaが空では登録できない' do
        @shop.name_kana = ''
        @shop.valid?
        expect(@shop.errors.full_messages).to include("Name kana can't be blank")
      end
      it 'textが空では登録できない' do
        @shop.text = ''
        @shop.valid?
        expect(@shop.errors.full_messages).to include("Text can't be blank")
      end
      it 'addressが空では登録できない' do
        @shop.address = ''
        @shop.valid?
        expect(@shop.errors.full_messages).to include("Address can't be blank")
      end
      it 'holidayが空では登録できない' do
        @shop.holiday = ''
        @shop.valid?
        expect(@shop.errors.full_messages).to include("Holiday can't be blank")
      end
      it 'telが空では登録できない' do
        @shop.tel = ''
        @shop.valid?
        expect(@shop.errors.full_messages).to include("Tel can't be blank")
      end
      it 'parking_idの値が1では登録できない' do
        @shop.parking_id = 1
        @shop.valid?
        expect(@shop.errors.full_messages).to include("Parking can't be blank")
      end
      it 'genre_idの値が1では登録できない' do
        @shop.genre_id = 1
        @shop.valid?
        expect(@shop.errors.full_messages).to include("Genre can't be blank")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @shop.password_confirmation = ''
        @shop.valid?
        expect(@shop.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが5文字以下であれば登録できない' do
        @shop.password = 'pass0'
        @shop.password_confirmation = 'pass0'
        @shop.valid?
        expect(@shop.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが数字だけであれば登録できない' do
        @shop.password = '123456'
        @shop.password_confirmation = '123456'
        @shop.valid?
        expect(@shop.errors.full_messages).to include('Password is invalid. Include both letters and numbers')
      end
      it 'passwordが英字だけであれば登録できない' do
        @shop.password = 'password'
        @shop.password_confirmation = 'password'
        @shop.valid?
        expect(@shop.errors.full_messages).to include('Password is invalid. Include both letters and numbers')
      end
      it 'name_kanaが全角カタカナ以外であれば登録できない' do
        @shop.name_kana = '長岡'
        @shop.valid?
        expect(@shop.errors.full_messages).to include('Name kana is invalid. Input full-width katakana characters')
      end
      it '重複したemailが存在する場合登録できない' do
        @shop.save
        another_shop = FactoryBot.build(:shop, email: @shop.email)
        another_shop.valid?
        expect(another_shop.errors.full_messages).to include('Email has already been taken')
      end
      it '全角文字を含むパスワードは登録できない' do
        @shop.password = 'ＡＢＣ１２３'
        @shop.password_confirmation = 'ＡＢＣ１２３'
        @shop.valid?
        expect(@shop.errors.full_messages).to include('Password is invalid. Include both letters and numbers')
      end
      it 'emailに@を含まない場合は登録できない' do
        @shop.email = 'tanaka.com'
        @shop.valid?
        expect(@shop.errors.full_messages).to include('Email is invalid')
      end
      it 'telが半角ハイフン(-)を含む形では保存できない' do
        @shop.tel = '999-9999-9999'
        @shop.valid?
        expect(@shop.errors.full_messages).to include('Tel is invalid', 'Tel is not a number')
      end
      it '全角数字を含むtelは保存できない' do
        @shop.tel = '９９９９９９９９９９９'
        @shop.valid?
        expect(@shop.errors.full_messages).to include('Tel is invalid', 'Tel is not a number')
      end
      it 'telが9桁以下では保存できない' do
        @shop.tel = '99999999'
        @shop.valid?
        expect(@shop.errors.full_messages).to include('Tel is invalid')
      end
      it 'telは12桁以上では保存できない' do
        @shop.tel = '999999999999'
        @shop.valid?
        expect(@shop.errors.full_messages).to include('Tel is invalid')
      end
    end
  end
end
