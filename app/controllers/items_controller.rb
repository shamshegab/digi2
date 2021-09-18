class ItemsController < ApplicationController
  before_action :authorize_controller
  def index
    @items = Item.all.order("id ASC")
  end

 
  def show
    @item = Item.find(params[:id])
    render :json => {price: @item.default_price}

  end

  def new
    @item = Item.new
  end

  def edit
  end

  def activated_items
    @items = Item.where(available: true)
    render :json => {price: @items}
  end

  def create
    @item = Item.new(items_params)
    respond_to do |format|
      if @item.save
        format.html { redirect_to items_url, notice: "Item was successfully created." }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  

  def destroy
    
    @item=Item.find(params[:id])
    @item.update(available: !(@item.available))
    respond_to do |format|
      format.html { redirect_to items_url, notice: "Item was successfully decativated." }
      format.json { head :no_content }
    end
  end
  def authorize_controller
    if !current_user.admin? 
      redirect_to root_path
    end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    

    # Only allow a list of trusted parameters through.
    def items_params
      params.require(:item).permit(:title,:default_price, :available,:id, {})
    end
end

