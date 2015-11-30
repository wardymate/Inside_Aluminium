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
end
