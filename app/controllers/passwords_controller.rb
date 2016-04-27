class PasswordsController < Devise::PasswordsController
  def new
    @title = "Przywracanie hasła do aplikacji Auto Stop Race"
    super
  end

  # POST /resource/password
  # def create
  #   super
  # end

  # GET /resource/password/edit?reset_password_token=abcdef
  # def edit
  #   super
  # end

  # PUT /resource/password
  def update
    @title = "Przywracanie hasła do aplikacji Auto Stop Race"
    super.tap do
      resource.tokens = {}
      resource.save
      sign_out
    end
  end

  # protected

  def after_resetting_password_path_for(resource)
    "http://www.autostoprace.pl/haslo-zostalo-zmienione/"
  end

  def after_sending_reset_password_instructions_path_for(resource_name)
    "http://www.autostoprace.pl/instrukcja-zmiany-hasla/"
  end
end
