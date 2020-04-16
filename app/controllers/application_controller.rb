class ApplicationController < ActionController::Base

	before_action :configure_permitted_parameters, if: :devise_controller?


	def after_sign_in_path_for(resource)
		case resource
		when EndUser
			end_user_yours_path
		when Admin
			admins_items_path
		end		
		
	end

	def after_sign_up_path_for(resource)
		end_users_yours_path
	end

	def after_sign_out_path_for(resource_or_scope)
		if resource_or_scope == :end_user
			new_end_user_session_path
		elsif resource_or_scope == :admin
			new_admin_session_path
		end	
		
	end

	protected
	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: 
			[:email, :last_name, :kana_last_name, :first_name,
				:kana_first_name, :is_deleted, :postal_code, :address, 
				:phone_number ])
	end

end
