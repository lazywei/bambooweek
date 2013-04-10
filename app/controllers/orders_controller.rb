class OrdersController < ApplicationController
  def show
    unless params[:mobile].nil?
      mobile = params[:mobile]
      @orders = Order.where('mobile = ?', mobile)
    else
      @orders = []
    end
  end

  def create
    items_info = params[:order][:items_info].split(',').map {|x| x.split(':')}
    params[:order].delete(:items_info)
    @order = Order.new(params[:order])

    items_info.each do |item|
      o_i = OrderItemship.new(:item_id =>item[0], :count => item[1])
      @order.order_itemships << o_i
    end
    
    if @order.save
      flash[:notice] = '訂單建立成功'
      session[:cart] = {}
      redirect_to root_path
    else
      flash[:notice] = '訂單建立失敗'
      redirect_to cart_path
    end
  end
end
