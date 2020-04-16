class EndUsersController < ApplicationController
  def yours
    @end_user = current_end_user
  end

  def edit
    @end_user = current_end_user
  end

  def update
    @end_user = current_end_user
    if @end_user.update(end_user_params)
      redirect_to end_user_yours_path
    else
      render 'edit'
    end
  end

  def leave
    @end_user = current_end_user
  end

  def hide
    @end_user = current_end_user
    @end_user.destroy
    redirect_to new_end_user_session_path
  end

  private
  def end_user_params
    params.require(:end_user).permit(:last_name, :first_name,
      :kana_last_name, :kana_first_name, :email, :postal_code,
      :address, :phone_number)
    
  end
end
