class ShopsController < ApplicationController
  def index
    @shops = Shop.order(created_at: 'DESC')
  end

  def show
    @shops = Shop.includes(:items)
    @shop = Shop.find(params[:id])
    @items = @shop.items.includes(:shop)
    @item_id2 = @items.where(category_id: 2)
    @item_id3 = @items.where(category_id: 3)
    @item_id4 = @items.where(category_id: 4)
    @item_id5 = @items.where(category_id: 5)
    @item_id6 = @items.where(category_id: 6)
    @item_id7 = @items.where(category_id: 7)
  end
end
