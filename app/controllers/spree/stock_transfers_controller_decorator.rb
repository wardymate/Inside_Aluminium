Spree::Admin::StockTransfersController.class_eval do
  alias_method :orig_create, :create
  def create
    variants = Hash.new(0)
    params[:variant].each_with_index do |variant_id, i|
      variants[variant_id] += params[:quantity][i].to_i
    end

    stock_transfer = Spree::StockTransfer.create(reference: params[:reference])
    stock_transfer.transfer(source_location,
                            destination_location,
                            variants)

    flash[:success] = Spree.t(:stock_successfully_transferred)
    redirect_to admin_stock_transfer_path(stock_transfer)
  end


end
