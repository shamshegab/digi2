class ReferringDoctorsController < InheritedResources::Base
  before_action :authorize_controller
def show
  redirect_to referring_doctors_path
end
  private

    def referring_doctor_params
      params.require(:referring_doctor).permit(:name, :email, :address, :phone, :mobile, :birthdate, :clinic)
    end
    def authorize_controller
      if !current_user.admin? && !current_user.accounting? && !current_user.secertary?
        redirect_to root_path
      end
    end
end
