class ConfirmationsController < Devise::ConfirmationsController

  def new
    @title = "Potwierdź swoje konto by skorzystać z aplikacji Auto Stop Race"
    super
  end

  def show
    @title = "Potwierdź swoje konto by skorzystać z aplikacji Auto Stop Race"
    if params[:confirmation_token].present?
      @original_token = params[:confirmation_token]
    elsif params[resource_name].try(:[], :confirmation_token).present?
      @original_token = params[resource_name][:confirmation_token]
    end

    self.resource = resource_class.find_by_confirmation_token @original_token

    super if resource.nil? or resource.confirmed?
  end

  def confirm
    @title = "Potwierdź swoje konto by skorzystać z aplikacji Auto Stop Race"
    @original_token = params[resource_name].try(:[], :confirmation_token)
    self.resource = resource_class.find_by_confirmation_token! @original_token
    resource.assign_attributes(permitted_params) unless params[resource_name].nil?

    if resource.valid? && resource.password_match?
      self.resource.confirm
      redirect_to "http://www.autostoprace.pl/konto-zostalo-aktywowane/"
    else
      render :action => 'show'
    end
  end

 private
   def permitted_params
     params.require(resource_name).permit(:confirmation_token, :password, :password_confirmation)
   end
end
