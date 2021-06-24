class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_params, only: [:index, :create]
  before_action :sold_out_item, only: [:index, :create]

  def index
    @purchase_address = PurchaseAddress.new()
  end
  
  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      redirect_to root_path
    else
      render :index
    end
  end
  
  private
  
  def purchase_params
    params.require(:purchase_address).permit(:postal_code, :shipping_area_id, :municipality,
      :house_number, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
    end
    
    def set_params
      @order = Item.find(params[:item_id])
    end

    def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: set_params[:price],  
        card: purchase_params[:token],    
        currency: 'jpy'                
      )
    end

    def sold_out_item
      redirect_to root_path if @order.purchase.present?
    end
  end
  