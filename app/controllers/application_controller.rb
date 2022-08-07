class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    public_end_users_path(resource)
  end

  def after_sign_out_path_for(resource)
    root_path
  end
end
