class PatientsController < InheritedResources::Base
  before_action :authorize_controller
  before_action :authenticate_user!

  def index
    @q = Patient.ransack(params[:q])
    @patients = @q.result.page(params[:page]).per(10)
  end
  
  def show
    @patient = Patient.find(params[:id])
  end
  
  private

    def patient_params
      params.require(:patient).permit(:mobile, :name, :address, :email)
    end

    def authorize_controller
      if !current_user.admin? && !current_user.accounting? && !current_user.secertary?
        redirect_to root_path
      end
    end

end
