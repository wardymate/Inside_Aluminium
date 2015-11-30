class Spree::Admin::SalesOrdersController < Spree::Admin::BaseController

  def new
    @sales_order = Spree::SalesOrder.new
    @stock_transfer = Spree::StockTransfer.find(params[:stock_transfer_id])
  end
end
