class ApplicationController < ActionController::Base
before_action :configure_permitted_parameters, if: :devise_controller?
    def after_sign_in_path_for(resource)
        root_path
    end

    def after_sign_out_path_for(resource)
        admin_session_path
    end

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password]) # 追加したい属性を追加
    end
end
