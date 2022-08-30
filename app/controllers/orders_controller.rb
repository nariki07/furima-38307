class OrdersController < ApplicationController
before_action :authenticate_user!, only: [:index]
before_action :set_order, only: [:index, :create]

  def index
    @order_delivery = OrderDelivery.new
    unless @item.user_id != current_user.id
          redirect_to root_path
    end
    if @item.order.present?
      redirect_to root_path
    end
  end

  def create
    @order_delivery = OrderDelivery.new(order_params)
    if  @order_delivery.valid?
        pay_item
        @order_delivery.save
        redirect_to root_path
    else
      render "index"
    end

  end

  private
  def order_params
    params.require(:order_delivery).permit(:postcode, :area_id, :city, :block, :building, :phone_number,:item_id,:user_id).merge(token: params[:token], user_id:current_user.id, item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  
    Payjp::Charge.create(
    amount: @item.price ,  
    card: order_params[:token], 
    currency: 'jpy'                 
    )
  end

  def set_order
    @item = Item.find(params[:item_id])
  end

end
