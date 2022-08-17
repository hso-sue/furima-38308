class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order_shipinfo = OrderShipinfo.new
  end

  def create
    @item = Item.find(params[:item_id])
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
    params.require(:order_shipinfo).permit(:post_code, :prefectures_id, :city, :address, :building_name, :telephone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = "sk_test_ac55cc3baeba940efd160691"
    Payjp::Charge.create(
      amount: @item.price,
      card: order_shipinfo_params[:token],
      currency: 'jpy'
    )
  end
end
