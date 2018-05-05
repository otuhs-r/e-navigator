class RegistrationsController < Devise::RegistrationsController

  protected

  def after_update_path_for(resource)
    show_path(resource)
  end
end
