class CasesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @q = Case.ransack(params[:q])
    @cases = @q.result.order("created_at DESC").page(params[:page]).per(10)

  end

  def create
    @case = Case.new(case_params)
    
    @case.owner_id = current_user.id
    if @case.save
      if params[:used_items_attributes].present?
        params[:used_items_attributes].each_with_index do | item, index|
          new_charged_price = @case.discount.present? ? (params[:price][index].to_i - (params[:price][index].to_i * (@case.discount/100))) : params[:price][index].to_i
          used_item = UsedItem.new(case_id: @case.id, item_id: item.to_i, charged_price: new_charged_price.to_i, price_before_discount: params[:price][index].to_i)
          used_item.save
        end
      end
      redirect_to case_path(@case)
      
    else
      
    end
  end

  def end_case
    @case = Case.find(params[:id])
    if @case.update(ended: Time.now)
      redirect_to cases_path
    end
  end

  def report_case
    @case = Case.find(params[:id])
    if @case.update(reported: Time.now)
      redirect_to case_path(@case)
    end
  end

  def contact_case
    @case = Case.find(params[:id])
    if @case.update(contacted: Time.now)
      redirect_to case_path(@case)
    else
      byebug
    end
  end

  def update
    if current_user.secertary? || current_user.admin? || current_user.accounting?
      @case = Case.find(params[:id])
      if @case.update(case_form_params)
        redirect_to case_path(@case)
      else
        
      end
    end
  end

def update_items
  if current_user.admin? || current_user.accounting?

    @case = Case.find(params[:id])
    if params[:discount].present?
      @case.update(discount: params[:discount])
    end
    if params[:used_items_attributes].present?
      @case.used_items.destroy_all
      params[:used_items_attributes].each_with_index do | item, index|
        new_charged_price = @case.discount.present? ? (params[:price][index].to_i - (params[:price][index].to_i * (@case.discount/100))) : params[:price][index].to_i
        used_item = UsedItem.new(case_id: @case.id, item_id: item.to_i, charged_price: new_charged_price.to_i, price_before_discount: params[:price][index].to_i)
        used_item.save
      end
    end
  end
  redirect_to case_path(@case)
    
end

def show
  @case = Case.find(params[:id])
  @total_price = @case.used_items.sum(:charged_price)
  
  
end
  private
    def case_form_params
      params.require(:case).permit(:note,:discount, :patient_id, :referring_doctor_id, :technition_id, :doctor_id, :ended, :image)
    end
    def case_params
      params.permit(:note, :patient_id,:discount, :referring_doctor_id, :technition_id, :doctor_id, :ended, :image)
    end

end
