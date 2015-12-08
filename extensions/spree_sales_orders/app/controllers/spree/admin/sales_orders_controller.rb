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
          stock_movement.update(sales_order_id: @sales_order.id, initial_ead: @date)
        end
      end
    update_stock_transfer_status
    @sales_order.update(status: 'In Progress')
      redirect_to admin_stock_transfer_path(@stock_transfer),
      notice: 'A New Sales Order Has Been Created'
    else
      render :new
    end
  end

  def edit
    @sales_order = Spree::SalesOrder.find(params[:id])
    @stock_transfer = Spree::StockTransfer.find(params[:stock_transfer_id])
  end

  def update
    @stock_transfer = Spree::StockTransfer.find(params[:stock_transfer_id])
    @sales_order = Spree::SalesOrder.find(params[:id])
    @stock_movements = @sales_order.stock_movements
    @sales_order.update(sales_order_params)
    if @sales_order.status == 'Complete'
      @stock_movements.each do |movement|
      movement.update(status: 'Complete')
      end
      if @stock_transfer.sales_orders.all? { |status| status[:status] == 'Complete' }
        @stock_transfer.update(status: 'Complete')
      end
    end
    if @sales_order.status == 'Sent To Stylmark'
      @stock_movements.each do |movement|
        movement.update(status: 'On Order')
      end
    end
    redirect_to admin_stock_transfer_path(@stock_transfer)
  end

  def destroy
    @stock_transfer = Spree::StockTransfer.find(params[:stock_transfer_id])
    @sales_order = Spree::SalesOrder.find(params[:id])
    @sales_order.stock_movements.destroy_all
    @sales_order.destroy

    redirect_to admin_stock_transfer_path(@stock_transfer)
  end

  private

  def sales_order_params
    params.require(:sales_order).permit!
  end

  def update_stock_transfer_status
    @stock_movements = Spree::StockTransfer.find(params[:stock_transfer_id]).stock_movements
    unless @stock_movements.any? { |stock_movement| stock_movement[:sales_order_id] == nil }
        @stock_transfer.update(status: 'Confirmed By Stylmark')
    end
  end

end
