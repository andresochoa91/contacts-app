class V1::SessionsController < ApplicationController
  def create
    @user = User.where(email: params[:email]).first

    if @user&.valid_password?(params[:password]) #shortcut for @user && @user.valid_password?(...)
      # render json: @user.as_json(only: [:id, :email, :authentication_token]), status: :created
      render :create, status: :created  #this is using jbuilder
    else
      head(:unauthorized)
    end
  end

  def destroy
    
  end
end