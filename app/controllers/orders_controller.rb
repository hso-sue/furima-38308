class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order

  def index
    @order_shipinfo = OrderShipinfo.new
    redirect_to root_path unless @item.user.id != current_user.id && @item.order.nil?
  end

  def create
    @order_shipinfo = OrderShipinfo.new(order_shipinfo_params)
    if @order_shipinfo.valid?
      pay_item
      @order_shipinfo.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end

  private

  def order_shipinfo_params
    params.require(:order_shipinfo).permit(:post_code, :prefectures_id, :city, :address, :building_name, :telephone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_shipinfo_params[:token],
      currency: 'jpy'
    )
  end

  def set_order
    @item = Item.find(params[:item_id])
  end
end
