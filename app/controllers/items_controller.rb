class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :set_item, only: [:show, :update, :edit]
  
  def index
    @items = Item.all.order( created_at: :DESC)
  end
  
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit

    if @item.user_id != current_user.id || @item.order.present?
          redirect_to root_path
    end
    
  end

  def show
  end

  def update    
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    item = Item.find(params[:id])

    unless item.user_id == current_user.id
          redirect_to action: :index
    end

    if item.destroy
        redirect_to root_path
    end

  end

  private

  def item_params
    params.require(:item).permit(:item, :text, :image, :category_id, :status_id,:deliverycharge_id , :area_id, :deliveryday_id, :price).merge(user_id: current_user.id)
  end

  def set_item
      @item = Item.find(params[:id])
  end

end