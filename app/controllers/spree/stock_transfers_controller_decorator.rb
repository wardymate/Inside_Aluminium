module Spree
  module Admin
    StockTransfersController.class_eval do

      def create
        if params.include?(:variant)
          variants = Hash.new(0)
          params[:variant].each_with_index do |variant_id, i|
            variants[variant_id] += params[:quantity][i].to_i
          end

          stock_transfer = Spree::StockTransfer.create(status: 'Created')
          stock_transfer.transfer(source_location,
                                  destination_location,
                                  variants)

          flash[:success] = 'Purchase Order Successfully Created!'
          redirect_to admin_stock_transfer_path(stock_transfer)
        else
          flash[:error] = 'You must add at least 1 part number!'
          render :new
        end
      end

      def edit
        @stock_transfer = Spree::StockTransfer.find(params[:id])
      end

      def update
        @stock_transfer = Spree::StockTransfer.find(params[:id])
        @stock_movements = @stock_transfer.stock_movements
        stock_transfer_params = params.require(:stock_transfer).permit(:status)
        @stock_transfer.update(stock_transfer_params)
        @stock_movements.each do |movement|
          movement.update(status: 'Pending')
        end
        redirect_to admin_stock_transfer_path(@stock_transfer)
      end

      def destroy
        @stock_transfer = Spree::StockTransfer.find(params[:id])
        @stock_transfer.sales_orders.destroy_all
        @stock_transfer.stock_movements.destroy_all
        @stock_transfer.destroy
        redirect_to admin_stock_transfers_path
      end

    end
  end
end
