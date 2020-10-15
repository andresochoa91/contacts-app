module V1
  class UsersController < ApplicationController
    def create



      @user = User.new(user_params)
    
      # respond_to do |format|
        if @user.save
          # Tell the UserMailer to send a welcome email after save
          # UserMailer.with(user: @user).welcome_email.deliver_later
          UserMailer.welcome_email(@user).deliver    
          # format.html { redirect_to(@user, notice: 'User was successfully created.') }
          # format.json { render json: @user, status: :created, location: @user }

          render :create 

        else
          # format.html { render action: 'new' }
          # format.json { render json: @user.errors, status: :unprocessable_entity }
          head(:unprocessable_entity)

        # end
      end
    end


    #   @user = User.new(user_params)

    #   if @user.save

    #     render :create 
    #   else
    #     head(:unprocessable_entity)
    #   end
    # end

    private

      def user_params
        params.require(:user).permit(:email, :password, :password_confirmation)
      end

  end
end