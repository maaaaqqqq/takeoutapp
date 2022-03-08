class ItemsController < ApplicationController
  before_action :authenticate_shop!, except: :show
  # before_action :set_shop, except: :show

  def index
    # @item = Item.new
    # @shop = Shop.find(params[:shop_id])
  end

  def new
    @item = Item.new
  end

  def create
    @shop = Shop.find(params[:shop_id])
    @item = @shop.items.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @shop = Shop.includes(:items)
    @item = Item.find(params[:shop_id])
    
    # @item = Item.new
  end

  private

  def item_params
    params.require(:item).permit(:name, :text, :price, :category_id, :image).merge(shop_id: current_shop.id)
  end

  # def set_shop
  #   @shop = Shop.find(params[:shop_id])
  # end
end
