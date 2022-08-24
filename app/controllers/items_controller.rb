class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :set_item, only: [:edit, :show]

  def index
    @items = Item.all.order( created_at: :asc)
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
    unless @item.user_id == current_user.id
      redirect_to action: :index
    end
  end

  def show
  end

  def update
    @item = Item.find(params[:id])
    
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
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


