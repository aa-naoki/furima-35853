class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :destroy]
  before_action :set_params, only: [:show, :edit, :update, :destroy]
  before_action :truth_user, only: [:edit, :update, :destroy]
  before_action :sold_out_item, only: [:edit, :update, :destroy]
  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(params[:id])
    else
      render :edit
    end
  end

  def destroy
    item = @item
    item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :explanation, :category_id, :status_id,
                                 :shipping_fee_id, :shipping_area_id, :shipping_day_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_params
    @item = Item.find(params[:id])
  end

  def truth_user
    redirect_to action: :index unless current_user.id == @item.user.id
  end

  def sold_out_item
    redirect_to root_path if @item.purchase.present?
  end
end
