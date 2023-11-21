# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @users = User.all
  end

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name, :surname)
  end
end
