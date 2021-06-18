class OrdersController < ApplicationController
  def index
    @order = Item.find_by(id: params[:item_id] )
  end
end
