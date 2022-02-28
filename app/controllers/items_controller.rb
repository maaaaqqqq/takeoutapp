class ItemsController < ApplicationController
  before_action :authenticate_shop!
  before_action :set_shop, expect: :show

  def index
    @item = Item.new
    @items = @shop.items.includes(:shop)
  end

  def new
    @item = Item.new
  end

  def create
    @item = @shop.items.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @items = Item.order(price: 'DESC')
    @item = Item.new
  end

  private

  def item_params
    params.require(:item).permit(:name, :text, :price, :category_id, :image).merge(shop_id: current_shop.id)
  end

  def set_shop
    @shop = Shop.find(params[:shop_id])
  end
end
