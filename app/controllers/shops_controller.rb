class ShopsController < ApplicationController
  def index
    @shops = Shop.includes(:shop)
  end
end
