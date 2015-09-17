class UsersController < ApplicationController
  before_action :set_all_feeds, only: [:new, :create, :edit, :update]

  before_action :authenticate_user!

  def index

  end

  def show
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user), :alert => "Access denied."
    end
  end
end
