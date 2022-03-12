class ItemsController < ApplicationController
  before_action :authenticate_shop!, except: :show
  before_action :authenticate_user!, except: :show
  before_action :set_shop_id, only: [:new, :create, :update]
  before_action :set_item_id, only: [:show, :edit]
  def index
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
    @shop = Shop.includes(:items)
  end

  def edit
    @shop = Shop.find(params[:id])

    unless shop_signed_in? && current_shop.id == @item.shop_id
      redirect_to root_path
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to shop_path(params[:shop_id])
    else
      render :edit
    end
  end

  def destroy
    item = Item.find(params[:shop_id])
    if shop_signed_in? && current_shop.id == item.shop_id
      if item.destroy
        render template:"items/destroy"
      end
    else
      redirect_to shop_item_path
    end
    
  end

  private

  def item_params
    params.require(:item).permit(:name, :text, :price, :category_id, :image).merge(shop_id: current_shop.id)
  end

  def set_shop_id
    @shop = Shop.find(params[:shop_id])
  end

  def set_item_id
    @item = Item.find(params[:shop_id])
  end
end
