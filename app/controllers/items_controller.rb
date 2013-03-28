class ItemsController < ApplicationController
  before_filter :find_item, :only => [:show, :add_into_cart]
  
  def index
    @items = Item.page(params[:page])
  end

  def show
  end

  def add_into_cart
    session[:cart] ||= []

    item_info = {
      :item_id => @item.id,
      :item_name => @item.name,
      :count => params[:count]
    }

    session[:cart] << item_info

    render :text => session
  end

  private

    def find_item
      @item = Item.find(params[:id])
    end
end
