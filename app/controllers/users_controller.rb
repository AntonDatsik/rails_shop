class UsersController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update, :destroy]
	
	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		respond_to do |format|
	      if @user.save
	      	sign_in @user
	        format.html { redirect_to @user, notice: 'Thank you for your registration' }
	        format.json { render action: 'show', status: :created, location: @user }
	      else
	        format.html { render action: 'new' }
	        format.json { render json: @user.errors, status: :unprocessable_entity }
	      end
    	end
	end

	def edit
	end

	def update
		respond_to do |format|
	      if @user.update(user_params)
	        format.html { redirect_to @user, notice: 'Cart was successfully updated.' }
	        format.json { head :no_content }
	      else
	        format.html { render action: 'edit' }
	        format.json { render json: @user.errors, status: :unprocessable_entity }
	      end
    	end
	end

	def destroy
		@user.destroy
	    respond_to do |format|
	      format.html { redirect_to users_url }
	      format.json { head :no_content }
	    end
	end

	def show
		@products = @user.products
	end

	private
		def user_params
			params.require(:user).permit(:name, :password, :password_confirmation, :email, :telephone_number)
		end

		def set_user
			@user = User.find(params[:id])
		end
end
