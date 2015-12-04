Spree::Admin::StockMovementsController.class_eval do

  def update
    @stock_movement = Spree::StockMovement.find(params[:id])
    params.require(:stock_movement).permit!

    if @stock_movement.update(params[:stock_movement])
      redirect_to admin_stock_transfer_path(@stock_movement.originator_id), notice: "Order successfully updated!"
    else
      render :edit
    end

    if @stock_movement.status == 'Complete'
      @stock_movement.update_stock_on_order_completion(@stock_movement)
    end
  end

  def new_1
    @stock_transfer = Spree::StockTransfer.find(params[:stock_transfer_id])
  end

  def create_1

    variants = Hash.new(0)
    params[:variant].each_with_index do |variant_id, i|
      variants[variant_id] += params[:quantity][i].to_i
    end

    stock_transfer = Spree::StockTransfer.find(params[:stock_transfer_id])
    if stock_transfer.transfer(source_location,
                            destination_location,
                            variants)

    flash[:success] = "Part Number(s) Added!"
    redirect_to admin_stock_transfer_path(stock_transfer)
    else
      render :new
    end
  end

  def destroy
    @stock_transfer = Spree::StockTransfer.find(params[:stock_transfer_id])
    @stock_movement = Spree::StockMovement.find(params[:id])
    @stock_movement.destroy
    redirect_to admin_stock_transfer_path(@stock_transfer)
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

end
