Spree::Admin::StockMovementsController.class_eval do

  def update
# this controller is overly complex - some of this logic should be extracted to a service object - the same with the other controllers
    @stock_movement = Spree::StockMovement.find(params[:id])
    params.require(:stock_movement).permit!

    if @stock_movement.update(params[:stock_movement])
      flash[:success] = "Order Successfully Updated!"
      redirect_to admin_stock_transfer_path(@stock_movement.originator_id)
    else
      render :edit
    end

    if @stock_movement.status == 'Complete'
      @stock_movement.update_stock_on_order_completion(@stock_movement)
    end

    if @stock_movement.sales_order_id != nil
      @sales_order = Spree::SalesOrder.find(@stock_movement.sales_order_id)
      if @sales_order.stock_movements.all? {|status| status[:status] == 'Complete' }
        @sales_order.update(status: 'Complete')
      end

      @stock_transfer = Spree::StockTransfer.find(@stock_movement.originator_id)
      if @stock_transfer.sales_orders.all? { |status| status[:status] == 'Complete' }
        @stock_transfer.update(status: 'Complete')
      end
    end
  end

  def new_1
    @stock_transfer = Spree::StockTransfer.find(params[:stock_transfer_id])
  end

  def create_1

    if params.include?(:variant)
      variants = Hash.new(0)
      params[:variant].each_with_index do |variant_id, i|
        variants[variant_id] += params[:quantity][i].to_i
      end

      stock_transfer = Spree::StockTransfer.find(params[:stock_transfer_id])
      stock_transfer.transfer(source_location,
                              destination_location,
                              variants)

      flash[:success] = "Part Number(s) Added!"
      redirect_to admin_stock_transfer_path(stock_transfer)

    else
      flash[:error] = 'You must add at least 1 part number!'
      redirect_to new_1_admin_stock_transfer_stock_movements_path(params[:stock_transfer_id])
    end
  end

  def new_2
    @sales_order = Spree::SalesOrder.find(params[:sales_order_id])
    @stock_transfer = Spree::StockTransfer.find(@sales_order.stock_transfer_id)
  end

  def create_2

    @sales_order = Spree::SalesOrder.find(params[:sales_order_id])
    if params.include?(:variant)
      variants = Hash.new(0)
      params[:variant].each_with_index do |variant_id, i|
        variants[variant_id] += params[:quantity][i].to_i
      end

      stock_transfer = Spree::StockTransfer.find(@sales_order.stock_transfer_id)
      stock_transfer.transfer_1(source_location,
                              destination_location,
                              variants,
                              sales_order_id)

      flash[:success] = "Part Number(s) Added!"
      redirect_to edit_admin_stock_transfer_sales_order_path(stock_transfer, @sales_order)

    else
      flash[:error] = 'You must add at least 1 part number!'
      redirect_to new_2_admin_sales_order_stock_movements_path(@sales_order)
    end
  end

  def destroy
    @stock_transfer = Spree::StockTransfer.find(params[:stock_transfer_id])
    @stock_movement = Spree::StockMovement.find(params[:id])
    @stock_movement.destroy
    redirect_to admin_stock_transfer_path(@stock_transfer)

    if @stock_movement.sales_order_id != nil
      @sales_order = Spree::SalesOrder.find(@stock_movement.sales_order_id)
      if @sales_order.stock_movements.count == 0
        @sales_order.destroy
      end
      if @stock_transfer.sales_orders.count == 0
        @stock_transfer.update(status: 'Void')
      end
    end

    if @stock_transfer.stock_movements.all? { |status| status[:status] == 'On Order' }
      @stock_transfer.update(status: 'Confirmed By Stylmark')
    end
  end


  private
  def load_stock_locations
    @stock_locations = Spree::StockLocation.active.order_default
  end

  def source_location
    @source_location ||= params.has_key?(:transfer_receive_stock) ? nil :
                           Spree::StockLocation.find(params[:transfer_source_location_id])
  end

  def destination_location
    @destination_location ||= Spree::StockLocation.find(params[:transfer_destination_location_id])
  end

  def sales_order_id
    @sales_order_id = params[:sales_order_id]
  end
end
