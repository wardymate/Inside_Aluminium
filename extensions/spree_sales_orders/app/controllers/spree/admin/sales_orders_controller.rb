class Spree::Admin::SalesOrdersController < Spree::Admin::BaseController

  def index
    @stock_transfer = Spree::StockTransfer.find(params[:stock_transfer_id])
    @sales_orders = @stock_transfer.sales_orders
  end

  def new
    @stock_transfer = Spree::StockTransfer.find(params[:stock_transfer_id])
    @sales_order = @stock_transfer.sales_orders.new
    @estimated_arrival_date = params[:date]
  end

  def create

    @stock_transfer = Spree::StockTransfer.find(params[:stock_transfer_id])
    @sales_order = @stock_transfer.sales_orders.new(sales_order_params)
    @date = params[:sales_order][:estimated_arrival_date].to_date

    if @sales_order.save
      @stock_transfer.stock_movements.each do |stock_movement|
        if stock_movement.estimated_arrival_date == @date
          stock_movement.update(sales_order_id: @sales_order.id)
        end
      end
      redirect_to admin_stock_transfer_path(@stock_transfer),
      notice: 'A New Sales Order Has Been Created'
    else
      render :new
    end
  end

  private

  def sales_order_params
    params.require(:sales_order).permit(:number, :estimated_arrival_date)
  end

end
