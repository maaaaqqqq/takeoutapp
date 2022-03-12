require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    sleep 0.1
  end

  describe 'メニューの投稿及び保存' do
    context '新規投稿できる場合' do
      it 'name,text,price,category_id,imageが存在し、正しい値であり、shopが紐付いていれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '新規投稿の保存ができない場合' do
      it 'nameが空では保存できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'textが空では保存できない' do
        @item.text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end
      it 'priceが空では保存できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it 'category_idの値が1で保存できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'imageが空では保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'priceの値が全角数字では保存できない' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it 'shopが紐づいていない場合は保存できない' do
        @item.shop = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Shop must exist')
      end
      it 'priceの値が9以下の場合は保存できない' do
        @item.price = 9
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 10')
      end
      it 'priceの値が整数でない場合は保存できない' do
        @item.price = 100.5
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be an integer')
      end
    end
  end
end
