class CartsController < ApplicationController
  before_filter :find_cart
  def show
  end

  def put_into
    @item = Item.find(params[:item_id])

    item_info = {
      :name => @item.name,
      :count => params[:count].to_i.abs,
      :price => @item.price
    }

    @cart[@item.id] = item_info
    session[:cart] = @cart

    redirect_to cart_path
  end

  def remove_from
    @cart.delete(params[:item_id].to_i) if @cart.include? params[:item_id].to_i
    session[:cart] = @cart

    redirect_to cart_path
  end

  private
    def find_cart
      @cart = session[:cart] || {}
    end
end
